require 'gosu'
require 'rubygems'

puts " 
********* Player One controls menu *********
* --------- Move: WASD ----------------- 1 *
* --------- Move: Arrow Keys ----------- 2 *
********************************************"
puts "\nEnter prefered controls setup: "
$player_one_controls_choice = gets.chomp
sleep 1

if $player_one_controls_choice == '1'
  $player_two_controls_choice = "Move: Arrow Keys"
  $player_one_controls_choice = "Move: WASD"
elsif $player_one_controls_choice == '2'
  $player_two_controls_choice = "Move: WASD"
  $player_one_controls_choice = "Move: Arrow Keys"
end


class GameWindow < Gosu::Window
  def initialize
    super 600, 300
    self.caption = "Tron"
    @welcome_message = Gosu::Font.new(self, Gosu::default_font_name, 120)
    @start = Gosu::Font.new(self, Gosu::default_font_name, 40)
    @quit = Gosu::Font.new(self, Gosu::default_font_name, 40)
    @box_image = Gosu::Image.new("box.png")
  end
  
  def update
    if button_down?(Gosu::MsLeft)
	  if (mouse_x >= 164 and mouse_x <= 360) and (mouse_y >= 220 and mouse_y <= 275) 
        close
	    require './game run.rb' 
	  end
    end
  end
  
  def draw
    @welcome_message.draw("Controls", 100, 0, 3.0, 1.0, 1.0, 0xff_0000ff)  
    @quit.draw("Play Game", 175, 225, 3.0, 1.0, 1.0, 0xff_0000ff)
    @start.draw("Player 1: #{$player_one_controls_choice}", 0, 125, 3.0, 1.0, 1.0, 0xff_0000ff)
    @start.draw("Player 2: #{$player_two_controls_choice}", 0, 175, 3.0, 1.0, 1.0, 0xff_0000ff)
    @box_image.draw(164, 220, 0) 
  end

  def needs_cursor?
    true
  end
end

GameWindow.new.show

