require "pry"


class Player
    attr_accessor :name, :life_points
    @@all_ennemies = []

    def initialize(name)
        @name = name
        @life_points = 10
        @@all_ennemies << self
    end

    def show_state
        puts "#{name} a #{life_points} points de vie"
    end

    def gets_damage(damage_num)
       @life_points = @life_points - damage_num

        if @life_points <= 0
            puts "Le joueur #{name} a été tué, game over !"
        end
    end

    def attacks(player2)
        puts "#{name} attaque #{player2.name}" 
        punch = player2.compute_damage
        player2.gets_damage(punch)
        puts "il lui inflige #{punch} points de dommages"
    end

    def compute_damage
        return rand(1..6)
    end

    def self.all
        return @@all_ennemies
    end

    def self.ennemies_atk(players)
        @@all_ennemies.each do |atk|
            if players.life_points > 0
               players = players.attacks(user)
               return players
            end
        end
    end

end

class HumanPlayer < Player

    attr_accessor :weapon_level
   


    def initialize(name, weapon)
        @weapon_level = weapon
        super(name)
        @life_points = 100
    end

    def show_state
        puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
    end

    def compute_damage
        return rand(1..6) * @weapon_level
    end

    def search_weapon
        dice_roll = rand(1..6)
            puts "Tu as trouvé une arme de niveau #{dice_roll}" 
                if dice_roll > @weapon_level 
                    puts "Great ! Cette arme est meilleur que ton arme actuelle, prend-la !"
                    @weapon_level = dice_roll + @weapon_level
                elsif dice_roll <= @weapon_level
                    puts "Sh$!t ! Cette arme n'est pas mieux que celle que j'ai, laisse tombé !"
                end
    end

    def search_health_pack
        dice_roll = rand(1..6)
        if dice_roll == 1
            puts "Tu n'a rien trouvé... :("
        elsif dice_roll == (2..5) 
            pack_fifty = 50
            @life_points = @life_points + 50
            puts "Bravo ! Tu as trouvé un pack de survie de +50 pts de vie."
        else dice_roll == 6 
            pack_hund = 80
            @life_points = @life_points + 80
            puts "Waow, tu as trouvé un pack de +80 points de vie !" 
        end
    end
end
