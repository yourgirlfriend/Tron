require 'gosu'
require 'rubygems'

a = 0

while a != 100
  puts "Loading Game From Server: #{a}%"
  a += 1
  sleep rand * 0.1
  system "cls"
end
puts "Loading Game From Server: #{a}%"
sleep 1



puts "\nWelcome "
sleep 2
class GameWindow < Gosu::Window
  def initialize
    super 600, 300
    self.caption = "Tron"
    @welcome_message = Gosu::Font.new(self, Gosu::default_font_name, 150)
    @start = Gosu::Font.new(self, Gosu::default_font_name, 40)
    @quit = Gosu::Font.new(self, Gosu::default_font_name, 40)
    @box_image = Gosu::Image.new("box.png")
   # @song = Gosu::Song.new("arcade.wav")
    #@song.play(true)
  end
  
  def update
    if button_down?(Gosu::MsLeft)
	    if (mouse_x >= 40 and mouse_x <= 240) and (mouse_y >= 170 and mouse_y <= 225) 
        close
	      require './part two.rb' 
	    end
    end
    
    if button_down?(Gosu::MsLeft)
	    if (mouse_x >= 365 and mouse_x <= 560) and (mouse_y >= 170 and mouse_y <= 225) 
	      close
	    end
	  end
	
  end
  
  def draw
    @welcome_message.draw("Tron", 150, 0, 3.0, 1.0, 1.0, 0xff_0000ff)  
    @start.draw("Play Game", 50, 175, 3.0, 1.0, 1.0, 0xff_0000ff) 
    @quit.draw("Quit Game", 375, 175, 3.0, 1.0, 1.0, 0xff_0000ff)
    @box_image.draw(40, 170, 0)
    @box_image.draw(365, 170, 0) 
  end

  def needs_cursor?
    true
  end
end

GameWindow.new.show

