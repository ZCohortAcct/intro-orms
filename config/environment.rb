require 'bundler'
Bundler.require

DB = {
  conn: SQLite3::Database.new('db/twitter.db')
}

sql_create = <<-SQL
  CREATE TABLE tweets (
    id INTEGER PRIMARY KEY,
    username TEXT,
    message TEXT
    );
SQL

sql_insert = <<-SQL
  INSERT INTO tweets (message, username) VALUES ('My PS4 name', 'justin_dude'), ('learning ORMs', 'zdrake');
SQL

# DB[:conn].execute(sql_create)
# DB[:conn].execute(sql_insert)

DB[:conn].results_as_hash = true

require_relative '../lib/tweet.rb'
require_relative '../lib/tweets_app.rb'
