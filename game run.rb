require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super 1680, 1080, true
    self.caption = "Tron"
	@bike_one_array = []
	@bike_one_array.push(Bike.new(self))
	@moving_right = false
	@moving_left = false
	@moving_up = false
	@moving_down = false
		@image_rotate_up = false
  end
  
  def are_touching?(obj1, obj2)
    obj1.x > obj2.x - obj1.width and obj1.x < obj2.x + obj2.width and obj1.y > obj2.y - obj1.height and obj1.y < obj2.y + obj2.height
  end

  def update
    @bike_one_array.each do |bike|
    if Gosu::button_down?(Gosu::KbRight)
	  @moving_right = true
	  @moving_left = false
	  @moving_up = false
	  @moving_down = false
	end
	
	if Gosu::button_down?(Gosu::KbLeft)
	  @moving_right = false
	  @moving_left = true
	  @moving_up = false
	  @moving_down = false
	end
	
	if @moving_right == true
	  bike.moveright
	  elsif @moving_left == true
	    bike.moveleft
	  elsif @moving_up == true
	  
	  elsif @moving_down == true
	end
	

	end
  end
  
  def draw
    @bike_one_array.each do |bike|
      bike.draw
	end
  end

  def needs_cursor?
    true
  end
  
  class Bike
 attr_reader :x, :y, :height, :width
  def initialize(the_window)
    @x = 0
    @y = 525
	@y_velocity = 10
	@width = 80
	@height = 80
	@image_rotate_up = false
	@image = Gosu::Image.new(the_window, "bike_one.png")
  end
  
  def draw
    @image.draw(@x, @y, 1)
  end
  
  def moveleft
    @x -= 8
    if @x <= 0
	  @x = 0
	end
  end
	
  def moveright
    @x += 8
	if @x >= 1575
	  @x = 1575
	end
  end
  
  def moveup
    @y -= 8
    if @y <= 0
	  @y = 0
	end
  end
	
  def movedown
    @y += 8
	if @y >= 1000
	  @y = 1000
	end
  end
  
    class BikeTwo
 attr_reader :x, :y, :height, :width
  def initialize(the_window)
    @x = 250
    @y = 800
	@y_velocity = 10
	@width = 80
	@height = 80
	@image = Gosu::Image.new(the_window, "bike_two.bmp")
  end
  
  def draw
    @image.draw(@x, @y, 1)
  end
  
  def moveleft
    @x -= 8
    if @x <= 0
	  @x = 0
	end
  end
	
  def moveright
    @x += 8
	if @x >= 739
	  @x = 739
	end
  end
  
end
end
end
GameWindow.new.show