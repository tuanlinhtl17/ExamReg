namespace :db do
  desc "remake database data"
  task remake_data: :environment do
    %w[db:drop db:create db:migrate].each do |task|
      Rake::Task[task].invoke
    end
    puts "You will be prompted to create data for project."
    
    Admin.create email: "admin@vnu.edu.vn", password: "123456"

    puts "The data was created successfully."
  end
end
