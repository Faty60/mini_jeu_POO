require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

while (player1.life_points > 0) and (player2.life_points > 0) do 

    puts "Voici l'état des combattants : "
    puts player1.show_state
    puts player2.show_state
    puts

    puts "Passons à l'attaque : "
    player1.attacks(player2)
        break if (player1.life_points <= 0) || (player2.life_points <= 0) 
    player2.attacks(player1)
    
    puts

        
end 


binding.pry
