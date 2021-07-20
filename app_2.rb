require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts" ------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

puts "Veuillez entrer un nom de joueur :"

name = gets.chomp

player1 = HumanPlayer.new(name)

player2 = Player.new("Josiane")
player3 = Player.new("José")

enemies = []

enemies.push(player2, player3)

while player1.life_points > 0 && (player2.life_points > 0 || player3.life_points > 0)
    
    puts player1.show_state

    puts "Quelle action veux-tu effectuer ?"
    choice = gets.chomp

    case choice
    when "a"
      player1.search_weapon
    when "s"
      player1.search_health_pack
    when "0"
      player1.attacks(player2)

      if player2.life_points > 0 && player3.life_points > 0
            enemies.each do |i| 
                i.attacks(player1)
            end
      elsif player2.life_points <= 0
        player3.attacks(player1)
      else 
        player2.attacks(player1)

    end
        puts player1.show_state
        puts player2.show_state
        puts player3.show_state
      

    when "1"
      player1.attacks(player3)

      if player2.life_points > 0 && player3.life_points > 0
            enemies.each do |i| 
                i.attacks(player1)
            end
      elsif player3.life_points <= 0
          player2.attacks(player1)
      else 
          player3.attacks(player1)
      end

        puts player1.show_state
        puts player2.show_state
        puts player3.show_state
      

    end
end

puts "La partie est finie."

if player1.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"
else
    puts "Loser ! Tu as perdu..."
end