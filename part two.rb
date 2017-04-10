require 'gosu'
require 'rubygems'

print "\nPlayer One Name: "
$p1_name = gets.chomp
sleep 1
print "\nPlayer Two Name: "
$p2_name = gets.chomp



class GameWindow < Gosu::Window
  def initialize
    super 600, 300
    self.caption = "Tron"
    @welcome_message = Gosu::Font.new(self, Gosu::default_font_name, 150)
	  @player_welcome = Gosu::Font.new(self, Gosu::default_font_name, 40)
	  @timer = Time.new
  end
  
  def update
    if Time.new - @timer > 5
	  close
	  require './controls.rb' 
	end
  end
  
  def draw
    @welcome_message.draw("Tron", 150, 0, 3.0, 1.0, 1.0, 0xff_0000ff)  
	  @player_welcome.draw("Welcome Player 1: #{$p1_name}. ", 0, 150, 3.0, 1.0, 1.0, 0xff_0000ff)
	  @player_welcome.draw("Welcome Player 2: #{$p2_name}. ", 0, 200, 3.0, 1.0, 1.0, 0xff_0000ff)
  end

  def needs_cursor?
    true
  end
end

GameWindow.new.show