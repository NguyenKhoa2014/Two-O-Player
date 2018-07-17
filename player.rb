class Player
     attr_reader :playername, :live
      
     def initialize(playername)
      @playername = playername
      @live = 3
     end

     def decrease_live
      @live = @live - 1
     end

     
end

 
 
 
 

 