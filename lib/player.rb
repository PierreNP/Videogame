require 'pry'

class Player
  attr_accessor :name, :life_points  

  def initialize(name)

    @name = name
    @life_points = 10
    
  end

  def show_state

    puts "#{@name} a #{@life_points} points de vie."

  end

  def gets_damage

    if @life_points <= 0
        puts "Le joueur #{@name} a été tué !"
    end

  end

  def attacks(victim)

    a = compute_damage

    victim.life_points = victim.life_points - a

    puts "Le joueur #{@name} attaque le joueur #{victim.name}"
    puts "Il lui inflige #{a} points de dégâts !"

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

    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}."

  end

  def compute_damage

    rand(1..6) * @weapon_level

  end

  def search_weapon

    weapon_level = rand(1..6)

    puts "Tu as trouvé une arme de niveau #{weapon_level}"

    if weapon_level > @weapon_level
        @weapon_level = weapon_level
        puts "Youhou ! Elle est meilleure que ton arme actuelle : tu la prends !"
    else
        puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end

  end

  def search_health_pack

    pack = rand(1..6)

    if pack == 1
        puts "Tu n'as rien trouvé..."
    elsif pack > 1 && pack <6
        @life_points = @life_points + 50
            if @life_points > 100
                @life_points = 100
            end
        puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    elsif pack = 6
        @life_points = @life_points + 80
            if @life_points > 100
                @life_points = 100
            end
    end


  end

end

# binding pry