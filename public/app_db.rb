require 'sqlite3'

# access to sqlite database
db = SQLite3::Database.new 'tar_first_db.sqlite'
# some command for DB
# db.execute "INSERT INTO Cars (Model, Price) values ('Volvo', 35000)"
# doesent work with block {}
db.execute 'SELECT * FROM Cars' do |car|
  puts car
  puts '=========='
end
db.close
