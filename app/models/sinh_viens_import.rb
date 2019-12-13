class SinhViensImport < ApplicationRecord
  require "roo"

  has_attached_file :excel
  validates_attachment_content_type :excel, content_type: [
    "application/vnd.ms-excel",
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    "application/zip"
  ]

  serialize :sub_sinh_viens_errors, Array
  enum status: [:importing, :success, :failed]

  def open_spreadsheet
    case File.extname excel_file_name
    when ".csv" then Csv.new(excel.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(excel.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(excel.path)
    else raise "Định dạng file không đúng"
    end
  end

  def load_imported_sinh_viens
    imported_sinh_viens = []
    spreadsheet = open_spreadsheet
    spreadsheet.sheets.each_with_index do |sheet, index|
      current_sheet = spreadsheet.sheet index
      header = current_sheet.row(1).map!(&:downcase).each do |e|
        e.sub!(" ", "_")
      end
      (2..current_sheet.last_row).map do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        item = SinhVien.find_by(id: row["mã_sinh viên"]) || SinhVien.new
        item.attributes = translate_attributes(row).to_hash 
        imported_sinh_viens << item       
      end
    end
    imported_sinh_viens
  end

  def imported_sinh_viens
    @imported_sinh_viens ||= load_imported_sinh_viens
  end

  def translate_attributes row
    key_map = {
      "tên" => 'ten', 
      "mã_sinh viên" => 'id', 
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
    imported_sinh_viens.map { |item| item.skip_password_validation = true }
    imported_sinh_viens.map(&:valid?).all?
  end

  def add_errors
    unless is_valid?
      imported_sinh_viens.each_with_index do |item, index|
        if !item.valid?
          item.errors.messages.values.each do |msg|
            sub_sinh_viens_errors << { line: index + 2, message: msg[0]}
          end
        end
      end
    end
  end

  def save_sinh_vien
    imported_sinh_viens.each(&:save!)
  end
end
