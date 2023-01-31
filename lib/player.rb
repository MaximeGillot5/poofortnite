class Player

    attr_accessor :name, :life_points
  
    def initialize(name)
      @name = name
      @life_points = 10
    end

    def show_state
        "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(damage_points)
        @life_points -= damage_points
        if @life_points <= 0
            puts "le joueur #{@name} a été tué !"
        else @life_points >= 0
            puts "le joueur #{@name} a #{@life_points} points de vie"
        end
    end

    def attacks(player)
        puts "#{@name} attaque #{player.name}"
       damage = compute_damage
       puts "Il lui inflige #{damage} points de dommages.."
       player.gets_damage(damage)
    end

    def compute_damage
        return rand(1..6)
        end


end

class HumanPlayer < Player
attr_accessor :weapon_level

def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
end

def show_state
    "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
end

def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon =rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon > weapon_level
        weapon_level = weapon_level + new_weapon - 1
        puts "Wow! Elle est meilleure que ton arme actuelle, tu la prends."
        else new_weapon <= weapon_level
            puts "Bon, cette nouvelle arme pue la merde.. Garde ton arme actuelle"
  end
end

def search_health_pack
    new_life_points = rand(1..6)
    case new_life_points
    when 1
      puts "Tu n'as rien trouvé..."
    when 2..5
    @life_points += 50
    @life_points = 100 if @life_points > 100
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    when 6
    @life_points += 80
    @life_points = 100 if @life_points > 100
    puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end

end