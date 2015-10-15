user1 = User.where(:first_name => 'Samuel', :last_name => 'Davis', :email => 'davissamuel@knights.ucf.edu').first_or_create(:password => 'password', :password_confirmation => 'password')
user2 = User.where(:first_name => 'Craig', :last_name => 'Livingston', :email => 'craiglivingston@knights.ucf.edu').first_or_create(:password => 'password', :password_confirmation => 'password')
user3 = User.where(:first_name => 'David', :last_name => 'Sweat', :email => 'dsweat@knights.ucf.edu').first_or_create(:password => 'password', :password_confirmation => 'password')

Role.where(:name => "super_admin").first_or_create
Role.where(:name => "admin").first_or_create
Role.where(:name => "student").first_or_create