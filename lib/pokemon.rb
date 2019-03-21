class Pokemon
  attr_accessor :id, :hp, :name, :type, :db

  @@all = []

  def initialize(data, hp=nil)
  end

  def self.all
    @@all
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    data = db.execute("SELECT * FROM Pokemon WHERE Pokemon.id = #{id};")
    new_pokeman = self.new(data)
    new_pokeman.id = data[0][0]
    new_pokeman.name = data[0][1]
    new_pokeman.type = data[0][2]
    new_pokeman.hp = data[0][3]
    new_pokeman
  end

  def BONUS
    db.execute("INSERT INTO Pokemon (hp) VALUES (?)", 60)
  end

end
