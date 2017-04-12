require 'gosu'
include Gosu


$dimension = 200
$line_limit = 70

class GameWindow < Gosu::Window
  def initialize
    super 1680, 1080, true
    self.caption = "Tron"
	@bike_one_array = []
  @bike_two_array = []
  @points = []
  @points2 = []
	@bike_one_array.push(Bike.new(self))
  @bike_two_array.push(BikeTwo.new(self))
	@moving_right = false
	@moving_left = false
	@moving_up = false
	@moving_down = false
  @moving_right_bike_two = false
	@moving_left_bike_two = false
	@moving_up_bike_two = false
	@moving_down_bike_two = false
  @wall = 4443153156
  #@bike_move_sound = Gosu::Sample.new("roboto.wav")
#  @bike_move_sound.play(true)
  end
  
  def are_touching?(obj1, obj2)
    obj1.x > obj2.x - obj1.width and obj1.x < obj2.x + obj2.width and obj1.y > obj2.y - obj1.height and obj1.y < obj2.y + obj2.height
  end

  def update

  @bike_one_array.each do |bike|
  @points << [ bike.x, bike.y ]
  if Gosu::button_down?(Gosu::KbRight) and @moving_left != true
	  @moving_right = true
	  @moving_left = false
	  @moving_up = false
	  @moving_down = false
	end
	
	if Gosu::button_down?(Gosu::KbLeft) and @moving_right != true
	  @moving_right = false
	  @moving_left = true
	  @moving_up = false
	  @moving_down = false
	end
	
  if Gosu::button_down?(Gosu::KbUp) and @moving_down != true
	  @moving_right = false
	  @moving_left = false
	  @moving_up = true
	  @moving_down = false
	end

  if Gosu::button_down?(Gosu::KbDown) and @moving_up != true
	  @moving_right = false
	  @moving_left = false
	  @moving_up = false
	  @moving_down = true
	end
	
  if @moving_right == true
	  bike.moveright
	  elsif @moving_left == true
	    bike.moveleft
	  elsif @moving_up == true
	    bike.moveup
	  elsif @moving_down == true
      bike.movedown
	end
	

end

  @bike_two_array.each do |biketwo|
      @points2 << [ biketwo.x, biketwo.y ]
  if Gosu::button_down?(Gosu::KbD) and @moving_left_bike_two != true
	  @moving_right_bike_two = true
	  @moving_left_bike_two = false
	  @moving_up_bike_two = false
	  @moving_down_bike_two = false
	end
	
	if Gosu::button_down?(Gosu::KbA) and @moving_right_bike_two != true
	  @moving_right_bike_two = false
	  @moving_left_bike_two = true
	  @moving_up_bike_two = false
	  @moving_down_bike_two = false
	end
	
  if Gosu::button_down?(Gosu::KbW) and @moving_down_bike_two != true
	  @moving_right_bike_two = false
	  @moving_left_bike_two = false
	  @moving_up_bike_two = true
	  @moving_down_bike_two = false
	end

  if Gosu::button_down?(Gosu::KbS) and @moving_up_bike_two != true
	  @moving_right_bike_two = false
	  @moving_left_bike_two = false
	  @moving_up_bike_two = false
	  @moving_down_bike_two = true
	end
	
  if @moving_right_bike_two == true
	  biketwo.moveright
	  elsif @moving_left_bike_two == true
	    biketwo.moveleft
	  elsif @moving_up_bike_two == true
	    biketwo.moveup
	  elsif @moving_down_bike_two == true
      biketwo.movedown
	end
	

	end
  end
  
  def draw
    @bike_one_array.each do |bike| 
      bike.draw
	end
  
  return if @points.empty?
	@points.inject(@points[0]) do |last, point|
		draw_line	last[0],last[1], Color::BLUE,
					point[0],point[1], Color::BLUE
		point
	end
   @bike_two_array.each do |biketwo| 
      biketwo.draw
	end
  
  return if @points2.empty?
	@points2.inject(@points2[0]) do |last, point|
		draw_line	last[0],last[1], Color::RED,
					point[0],point[1], Color::RED
		point
	end
  end

  def needs_cursor?
    true
  end
  
  class Bike
 attr_reader :x, :y, :height, :width
  def initialize(the_window)
    @x = 1625
    @y = 525
	  @y_velocity = 10
  	@width = 80
  	@height = 80
    @angle = 0
    @image = Gosu::Image.new(the_window, "bike_one.png")
  end
  
  def draw
    @image.draw_rot(@x, @y, 1, @angle + 180)
  end
  
  def moveleft
    @x -= 6
    @angle = 0
    if @x <= 50
	  @x = 50
	end
  end
	
  def moveright
    @x += 6
    @angle = -180
	if @x >= 1630
	  @x = 1630
	end
  end
  
  def moveup
    @y -= 6
    @angle = 90
    if @y <= 50
	  @y = 50
	end
  end
	
  def movedown
    @y += 6
    @angle = -90
	if @y >= 1028
	  @y = 1028
	end
  end
  end

    class BikeTwo
 attr_reader :x, :y, :height, :width
  def initialize(the_window)
    @x = 50
    @y = 525
	  @y_velocity = 10
  	@width = 80
  	@height = 80
    @angle = 0
    @image = Gosu::Image.new(the_window, "bike_one.png")
  end
  
  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
  
  def moveleft
    @x -= 6
    @angle = -180
    if @x <= 50
	  @x = 50
	end
  end
	
  def moveright
    @x += 6
    @angle = 0
	if @x >= 1630
	  @x = 1630
	end
  end
  
  def moveup
    @y -= 6
    @angle = -90
    if @y <= 50
	  @y = 50
	end
  end
	
  def movedown
    @y += 6
    @angle = 90
	if @y >= 1028
	  @y = 1028
	end
  end
end
end
GameWindow.new.show