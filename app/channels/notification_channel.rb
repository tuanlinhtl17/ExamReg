class NotificationChannel < ApplicationCable::Channel  
  def subscribed
    stream_from "notifications_channel_#{current_admin.id}"
  end
end  
