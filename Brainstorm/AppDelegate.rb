#
#  AppDelegate.rb
#  Brainstorm
#
#  Created by Jon Doud on 9/22/11.
#  Copyright 2011 Itinerant Software Solutions. All rights reserved.
#

require 'rubygems'
require 'sqlite3'

require 'CategoryRecord'
require 'NoteRecord'

require 'FileMenu'
require 'ViewMenu'

class AppDelegate
    attr_accessor :window
    attr_accessor :categories, :notes
    attr_accessor :categoryList, :noteList, :noteText
    attr_accessor :menuFile, :menuView
    attr_accessor :db
    
    def applicationDidFinishLaunching(a_notification)
        # Insert code here to initialize your application
    end
    
    def awakeFromNib
        @db = SQLite3::Database.new( "/Users/jdoud/Library/Application Support/Brainstorm/brainstorm.sqlite" )
        
        # connect menus
        #@menuFile = FileMenu.new(@categories, @notes)
        #@menuView = ViewMenu.new
        #@menuView.setLists(@categories, @notes)
        
        # get initial data
        @categories.addObjects( getCategories() )
        @notes.addObjects( getNotes() )
    end

    def getCategories
        rows = Array.new
        @db.execute("select id, name from categories order by upper(name)") do |row|
            categoryTemp = CategoryRecord.new
            categoryTemp.id = row[0]
            categoryTemp.name = row[1]
            rows << categoryTemp
        end
        return rows
	end
    
    def getNotes
        rows = Array.new
        @db.execute("select id, category_id, name, note_text from notes order by upper(name)") do |row|
            noteTemp = NoteRecord.new
            noteTemp.id = row[0]
            noteTemp.category_id = row[1]
            noteTemp.name = row[2]
            data = NSData.alloc.initWithData(row[3])
            noteTemp.note_text = data
            rows << noteTemp
        end
        return rows
	end
    
    def saveNote(sender)
        puts @notes.selectedItems[0].name
    end
    
end

