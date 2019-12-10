class DuDieuKiensImport < ApplicationRecord
  require "roo"

  has_attached_file :excel
  validates_attachment_content_type :excel, content_type: ["application/zip"]

  serialize :sub_du_dieu_kiens_errors, Array
  enum status: [:importing, :success, :failed]

  def open_spreadsheet
    case File.extname excel_file_name
    when ".csv" then Csv.new(excel.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(excel.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(excel.path)
    else raise "Định dạng file không đúng"
    end
  end

  def load_imported_du_dieu_kiens
    imported_du_dieu_kiens = []
    spreadsheet = open_spreadsheet
    spreadsheet.sheets.each_with_index do |sheet, index|
      current_sheet = spreadsheet.sheet index
      header = current_sheet.row(1).map!(&:downcase).each do |e|
        e.sub!(" ", "_")
      end
      (2..current_sheet.last_row).map do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        item = DuDieuKien.find_by(sinh_vien_id: row["Mã sinh viên"]) || DuDieuKien.new
        item.attributes = translate_attributes(row).to_hash 
        imported_du_dieu_kiens << item       
      end
    end
    imported_du_dieu_kiens
  end

  def imported_du_dieu_kiens
    @imported_du_dieu_kiens ||= load_imported_du_dieu_kiens
  end

  def translate_attributes row
    key_map = {
      "mã_sinh viên" => "sinh_vien_id"
    }
    row.transform_keys! {|k| key_map[k]}
  end

  def class_name_valid? class_name
    defined? class_name
  end

  def is_valid?
    imported_du_dieu_kiens.map(&:valid?).all?
  end

  def add_errors
    unless is_valid?
      imported_du_dieu_kiens.each_with_index do |item, index|
        if !item.valid?
          item.errors.messages.values.each do |msg|
            sub_du_dieu_kiens_errors << { line: index + 2, message: msg[0]}
          end
        end
      end
    end
  end

  def save_du_dieu_kien
    imported_du_dieu_kiens.each(&:save!)
  end

  def get_mon_thi
    mon_thi = nil
    i = 0
    loop do
      if imported_du_dieu_kiens[i].valid?
        mon_thi = imported_du_dieu_kiens[i].mon_thi
        break
      else
        if i == imported_du_dieu_kiens.length - 1
          return nil
        else
          i += 1
        end
      end
    end
    MonThi.find_by id: mon_thi.id
  end
end
