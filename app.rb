require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Chachills")
player2 = Player.new("Pequito")

puts "Voici l'état de chaque joueur :"

puts ""
puts ""

puts "A ma gauche,  #{player1.name} !"
puts "A ma droite, #{player2.name} !"
puts ""

puts "#{player1.name} a #{player1.life_points} points de vie.."
puts "#{player2.name} a #{player2.life_points} points de vie.."
puts ""

puts "Passons maintenant au combat !"
puts ""

while player1.life_points > 0 && player2.life_points > 0
    player2.attacks player1
  
    if player1.life_points <= 0
      break
    end
  
    player1.attacks player2

    puts ""
  
    if player2.life_points <= 0
      break
    end
  end

binding.pry