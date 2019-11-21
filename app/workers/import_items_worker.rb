class ImportItemsWorker
  include Sidekiq::Worker

  def perform data
    items_import_id = data[0]
    current_admin_id = data[1]
    link = data[2]+ "#import"
    @items_import = ItemsImport.find_by id: items_import_id
    created_at = @items_import.created_at.strftime("%H:%M %d/%m/%Y")
    now = Time.now.strftime("%H:%M %d/%m/%Y")
    if @items_import 
      if @items_import.is_valid? && @items_import.save_item
        @items_import.status = :success
        @items_import.save
        message = { time: created_at, error: false, now: now, link: link }
      else
        @items_import.status = :failed
        @items_import.add_errors
        @items_import.save
        message = { time: created_at, error: true, now: now, link: link }
      end  
    else
      message = { info: "Không tìm thấy file import", error: true, now: now, link: link }
    end 
    ActionCable.server.broadcast "notifications_channel_#{current_admin_id}", message: message.to_json
  end
end
