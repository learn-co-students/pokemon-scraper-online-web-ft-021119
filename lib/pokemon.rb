class Pokemon
  attr_accessor :id, :hp, :name, :type, :db

  @@all = []

  def initialize(data, hp=nil)
  end

  def self.all
    @@all
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    data = db.execute("SELECT * FROM pokemon WHERE pokemon.id = #{id};")
    new_pokeman = self.new(data)
    new_pokeman.id = data[0][0]
    new_pokeman.name = data[0][1]
    new_pokeman.type = data[0][2]
    new_pokeman.hp = data[0][3]
    new_pokeman
  end

  def BONUS
    db.execute("INSERT INTO pokemon (hp) VALUES (?)", 60)
    pikachu.alter_hp(59, db)
    magikarp.alter_hp(0, db)

  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [new_hp], [self.id])
    self.hp = new_hp
  end


end
