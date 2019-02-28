require "sqlite3"
require 'csv'
require 'pry'

db = SQLite3::Database.new("ds.db")

# Create a database
rows = db.execute("
  CREATE TABLE IF NOT EXISTS guests ('id INTEGER PRIMARY KEY,
    year INTEGER,
    occupation TEXT,
    show_date TEXT,
    group TEXT,
    guest_list TEXT')
    ")


csv = CSV.read('daily_show_guests.csv')



CSV.parse(csv, headers: true) do |row|
  db.execute "INSERT INTO guests VALUES (?, ?, ?, ?, ?)", row.fields
end


 db.execute( "SELECT * FROM guests")


binding.pry
