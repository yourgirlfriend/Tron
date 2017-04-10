require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super 600, 300
    self.caption = "Tron"
	
  end
  
  def are_touching?(obj1, obj2)
    obj1.x > obj2.x - obj1.width and obj1.x < obj2.x + obj2.width and obj1.y > obj2.y - obj1.height and obj1.y < obj2.y + obj2.height
  end

  def update
    
  end
  
  def draw
  end

  def needs_cursor?
    true
  end
end

GameWindow.new.show