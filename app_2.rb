require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "-----------------------------------------------"
puts "        Salut à toi jeune développeur !        "
puts "       Tu veux dégommer Josiane et José ?      "
puts "      La question elle est vite répondue !     "
puts "-----------------------------------------------"

puts "Quel est ton prénom ? Ou pseudo ? Ou blaze ? bref"
print ">"
user_name = gets.chomp.to_s
user = HumanPlayer.new("#{user_name}")
puts "T'aimes la castagne, #{user_name} ? Alors bienvenue à toi petit loubard !"
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = []
enemies << player1
enemies << player2
puts "Combat versus : "
puts
puts "*****************************************************************"

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
  puts "Voici l'état de ta santé physique et mentale :"
  puts  user.show_state
  puts 
  puts "Alors,on fait quoi ?"
  puts "<a> On tente de trouver une meilleure arme"
  puts "<s> On passe vite fait à l'hosto, c'est chaud là"
  puts
  puts "Ou tu préfères bourriner ?"
  puts "<0> Josiane a '#{player1.show_state}'"
  puts "<1> José a '#{player2.show_state}'"
  puts "--------------------------------------------------------------"
  print ">"
  choice = gets.chomp
  if choice == "a"
    user.search_weapon
  elsif choice == "s"
    user.search_health_pack
  elsif choice == "0"
    user.attacks(player1)
  elsif choice == "1"
    user.attacks(player2)
  elsif choice != "a" || "s" || "0" || "1"
    puts "Privé de bagarre, va dans ta chambre et attends le tour suivant."
  end
  puts "C'est à ton tour de te faire bastonner !"
  puts
 