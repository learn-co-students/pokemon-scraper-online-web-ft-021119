class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp 
  # database_connection = SQLite3::Database.new('db/my_database.db')

  def initialize(name:, id:, type:, db:, hp: nil)
    # Scraper.new(db)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end 
  
  def self.find(id, db)
    name = db.execute("SELECT name FROM pokemon WHERE pokemon.id = #{id}").flatten[0]
    type = db.execute("SELECT type FROM pokemon WHERE pokemon.id = #{id}").flatten[0]
    new_pokemon = Pokemon.new(name: name, id: id, type: type, db: db, hp: 60)
  end 
  
end
