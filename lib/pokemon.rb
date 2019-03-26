require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []
  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id 
    @name = name
    @type = type 
    @db = db 
    @hp = hp 
    @@all << self 
  end 
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end 
  def self.find(id, db)
    #@@all.find {|pokemon| pokemon.id == id}
    found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten 
        #[1, "Pikachu", "electric"] 
    id = found_pokemon[0]
    name = found_pokemon[1]
    type = found_pokemon[2]
    hp = found_pokemon[3]
    new_pokemon = Pokemon.new(id: id, name: name, type: type, hp: hp, db: db)
  end 
  def alter_hp(new_hp, db)
  #   db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id = #{self.id}")
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end 
end