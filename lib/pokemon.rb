require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    name = db.execute("SELECT name FROM pokemon WHERE id = ?", id).flatten[0]
    type = db.execute("SELECT type FROM pokemon WHERE id = ?", id).flatten[0]
    #binding.pry
    if db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten.size == 4
      hp = db.execute("SELECT hp FROM pokemon WHERE id = ?", id).flatten[0]
      Pokemon.new(id: id, name: name, type: type, db: db, hp: hp)
    else
      Pokemon.new(id: id, name: name, type: type, db: db)
    end
  end

  def self.all
    @@all
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
    #binding.pry
    self.hp = hp
  end
end
