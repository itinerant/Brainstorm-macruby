require 'rubygems'
require 'sqlite3'

module DataAccess
  class DataObject
  	def initialize
	  @@database = SQLite3::Database.new( "/User/jdoud/Library/Application Support/Brainstorm/brainstorm.sqlite" )
  	end
  	
	def getCategories
        rows = Array.new
	  @@database.execute("select * from categories") do |row|
          categoryTemp = 
		rows << row[0]
	  end
	  rows.sort!
	  return rows
	end
=begin	
	#TODO implement newCategory
	#TODO implement renameCategory
	#TODO implement deleteCategory
	
	def getNotes(category)
	  rows = []
	  query = "select name from notes where category_id = "
	  query += "(select id from categories where name = '"
	  query += category.gsub("'", "''")
	  query += "')"
	  @@database.execute(query) do |row|
		rows << row[0]
	  end
	  rows.sort!
	  return rows
	end
	
	#TODO implement newNote
	#TODO implement renameNote
	#TODO implement deleteNote
	
	def getNoteText(category, note)
	  query = "select note_text from notes_backup where category_id = "
	  query += "(select id from categories where name = '"
	  query += category.gsub("'", "''")
	  query += "')"
	  query += " and name = '"
	  query += note.gsub("'", "''")
	  query += "'"
	  @@database.execute(query) do |row|
		return row[0]
	  end
	end
	
	def saveNoteText(category, note, text)
	  #BUG only save note if there is a note in the category
	  query = "update notes_backup set note_text = '"
	  query += text.gsub("'", "''")
	  query += "' where category_id = "
	  query += "(select id from categories where name = '"
	  query += category.gsub("'", "''")
	  query += "')"
	  query += " and name = '"
	  query += note.gsub("'", "''")
	  query += "'"
	  @@database.execute(query)
	end
=end
  end
end
