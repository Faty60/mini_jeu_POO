require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
puts " |Welcome to... 'Ils veulent tous ma POO :(       |"
puts " |Le but du jeu est d'être le dernier survivant !!|"
print "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
puts 

puts "Choisi un nom de combattant :"
print "> "
user = HumanPlayer.new(gets.chomp, 1)

puts "Bienvenue dans l'arène #{user.name} !!"

player1 = Player.new("Josiane")
player2 = Player.new("José")
menu_on =  true

while (user.life_points > 0) && (player1.life_points > 0 || player2.life_points > 0)
    puts " Résumé de votre état : "
    print user.show_state
    while menu_on
        puts " ==========================================="
        puts "Quella action veux-tu effectuer ?"
        puts "[a] chercher un meilleur arme"
        puts "[s] chercher à se soigner"
        puts "[e] connaître son état de santé"
        puts " "
        puts "Attaquer un joueur en vu : "
        puts "[0] Joisiane 10 points de vie "
        puts "[1] José 10 points de vie"
    
        puts "Entrez votre choix :"
        print "> "
        choice = gets.chomp
        if choice == "a"
          user.search_weapon
        elsif choice == "s"
          user.search_health_pack
        elsif choice == "e"
            user.show_state
        elsif choice == "0"
           user.attacks(player1)
        elsif choice == "1"
            user.attacks(player2)
        end
    end
    puts "Les ennemies attaquent !!!"
    player1.attacks(user)
        break if (player1.life_points <= 0) || (player2.life_points <= 0) 
    player2.attacks(user) 
end



