#
#  NoteRecord.rb
#  Brainstorm
#
#  Created by Jon Doud on 9/22/11.
#  Copyright 2011 Itinerant Software Solutions. All rights reserved.
#

class NoteRecord
    
    attr_accessor :id, :category_id, :name, :note_text
    
	def to_s
		puts "Category: #{@category_id} - #{@name}"
	end
end

