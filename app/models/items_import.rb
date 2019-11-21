class ItemsImport < ApplicationRecord
  require "roo"

  has_attached_file :excel
  validates_attachment_content_type :excel, content_type: ["application/zip"]

  serialize :sub_items_errors, Array
  enum status: [:importing, :success, :failed]

  def open_spreadsheet
    case File.extname excel_file_name
    when ".csv" then Csv.new(excel.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(excel.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(excel.path)
    else raise "Định dạng file không đúng"
    end
  end

  def load_imported_items
    imported_items = []
    spreadsheet = open_spreadsheet
    spreadsheet.sheets.each_with_index do |sheet, index|
      current_sheet = spreadsheet.sheet index
      header = current_sheet.row(1).map!(&:downcase).each do |e|
        e.sub!(" ", "_")
      end
      (2..current_sheet.last_row).map do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        class_name = sheet.slice(0..-1).constantize
        item = class_name.find_by(ma_sv: row["Mã sinh viên"]) || class_name.new
        item.attributes = translate_attributes(row).to_hash 
        imported_items << item       
      end
    end
    imported_items
  end

  def imported_items
    @imported_items ||= load_imported_items
  end

  def translate_attributes row
    key_map = {
      "tên" => 'ten', 
      "mã_sinh viên" => 'ma_sv', 
      "ngày_sinh" => 'ngay_sinh', 
      "khoa" => 'khoa',
      "lớp" => 'lop', 
      "email" => 'email'
    }
    row.transform_keys! {|k| key_map[k]}
  end

  def class_name_valid? class_name
    defined? class_name
  end

  def is_valid?
    imported_items.map { |item| item.skip_password_validation = true }
    imported_items.map(&:valid?).all?
  end

  def add_errors
    unless is_valid?
      imported_items.each_with_index do |item, index|
        if !item.valid?
          item.errors.messages.values.each do |msg|
            sub_items_errors << { line: index + 2, message: msg[0]}
          end
        end
      end
    end
  end

  def save_item
    imported_items.each(&:save!)
  end
end
