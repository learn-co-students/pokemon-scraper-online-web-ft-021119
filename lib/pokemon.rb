require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  @@all = []

  def initialize(id:, name:, type:, hp: 60, db:)
    @id = id
    @name = name
    @hp = hp
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type);
  end

  def self.find(id_num, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", id_num).flatten;
    Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: db)
  end

  def alter_hp(new_hp, db)
    pokemon_id = self.id
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", new_hp, pokemon_id)
  end
end
class Pokemon
end
