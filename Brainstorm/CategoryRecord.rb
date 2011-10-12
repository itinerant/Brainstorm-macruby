#
#  CategoryRecord.rb
#  Brainstorm
#
#  Created by Jon Doud on 9/22/11.
#  Copyright 2011 Itinerant Software Solutions. All rights reserved.
#

class CategoryRecord
    
    attr_accessor :id, :name
    
	def to_s
		puts @name
	end
end