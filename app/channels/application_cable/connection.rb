module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_admin

    def connect
      self.current_admin = find_verified_admin
    end

    private
      def find_verified_admin
        if current_admin = Admin.find_by(id: cookies.signed['admin.id'])
          current_admin
        else
          reject_unauthorized_connection
        end
      end
  end
end
