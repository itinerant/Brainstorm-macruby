#
#  ViewMenu.rb
#  Brainstorm
#
#  Created by Jon Doud on 9/22/11.
#  Copyright 2011 Itinerant Software Solutions. All rights reserved.
#


class ViewMenu
    attr_accessor :cList, :nList
    
    def setLists(c, n)
        @cList = c
        @nList = n
    end
    
    ################################
    # Prev/Next Menu Items
    ################################
    def previousCategory(sender)
        puts "previous"
    end
    
    def nextCategory(sender)
    end
    
    def previousNote(sender)
    end
    
    def nextNote(sender)
    end

end