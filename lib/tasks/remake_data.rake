namespace :db do
  desc "remake database data"
  task remake_data: :environment do
    %w[db:drop db:create db:migrate].each do |task|
      Rake::Task[task].invoke
    end
    puts "You will be prompted to create data for project."
    
    Admin.create email: "admin@vnu.edu.vn", password: "123456"

    6.times.each do |t|
      HocPhan.create ten: "Mon hoc #{t + 1}", so_tin_chi: rand(1..4)
    end

    3.times.each do |t|
      PhongMay.create ten: "#{t + 1}-G2", so_may: 20 + t
    end

    ky_thi_1 = KyThi.new ten: "Học kỳ I", nam_hoc: "2019-2020", bat_dau_dang_ky: "2019-12-10", ket_thuc_dang_ky: Date.today + 4
    ky_thi_1.save validate: false
    KyThi.create ten: "Học kỳ II", nam_hoc: "2019-2020", bat_dau_dang_ky: "2020-4-10", ket_thuc_dang_ky: "2020-4-24"

    5.times.each do |t|
      MonThi.create ky_thi_id: 1, hoc_phan_id: (t + 1)
    end

    MonThi.create ky_thi_id: 2, hoc_phan_id: 6

    SinhVien.create id: "16021400", ten: "Nguyễn Tuấn Linh", ngay_sinh: "1998-1-12", khoa: "CNTT",
                    lop: "CAC", password: "123456", email: "tuanlinhtl17@gmail.com"
    SinhVien.create id: "17021400", ten: "Nguyễn Minh Tâm", ngay_sinh: "1998-12-1", khoa: "CNTT",
                    lop: "CAC", password: "123456", email: "westlife112@gmail.com"
    
    5.times.each do |t|
      DuDieuKien.create mon_thi_id: (t + 1), sinh_vien_id: "16021400"
    end 
    
    DuDieuKien.create mon_thi_id: 6, sinh_vien_id: "16021400"

    10.times.each do |t|
      time = rand(7..16)
      ct = CaThi.new ten: "Ca thi #{t + 1}", bat_dau: "#{time}:00:00", 
                  ket_thuc: "#{time + 1}:00:00", ngay_thi: "#{ky_thi_1.ket_thuc_dang_ky + rand(1..14)}",
                  ky_thi_id: 1, mon_thi_id: rand(1..5)
      ct.save
      puts ct.errors.messages if !ct.errors.messages.empty?
    end

    6.times.each do |t|
      CaThiPhongMay.create ca_thi_id: (t + 1), phong_may_id: t % 3 + 1
    end

    6.times.each do |t|
      if (t + 1) % 2 != 0
        dk1 = DangKy.new(sinh_vien_id: 16021400, ca_thi_phong_may_id: t + 1) 
        dk1.save
        puts dk1.errors.messages if !dk1.errors.messages.empty?
      end

      if (t + 1) % 2 == 0
        dk2 = DangKy.new(sinh_vien_id: 17021400, ca_thi_phong_may_id: t + 1)   
        dk2.save 
        puts dk2.errors.messages if !dk2.errors.messages.empty?
      end
    end

    6.times.each do |t|
      if (t + 1) % 2 == 0
        dk1 = DangKy.new(sinh_vien_id: 16021400, ca_thi_phong_may_id: t + 1) 
        dk1.save
        puts dk1.errors.messages if !dk1.errors.messages.empty?
      end

      if (t + 1) % 2 != 0
        dk2 = DangKy.new(sinh_vien_id: 17021400, ca_thi_phong_may_id: t + 1)   
        dk2.save 
        puts dk2.errors.messages if !dk2.errors.messages.empty?
      end
    end

    puts "The data was created successfully."
  end
end
