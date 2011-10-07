namespace :db do
desc "Fill database with sample data"
task :populate => :environment do
Rake::Task['db:reset'].invoke
admin = User.create!(:name => "Admin",
:email => "admin@email.com",
:password => "password",
:password_confirmation => "password")
admin.toggle!(:admin)
end
end