
class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name,type,db)
    db.execute("INSERT INTO Pokemon(name,type) VALUES (?,?)",name,type)
  end
  # In the database, pass in the scraped name and type. Execute (on the db)...insert these into Pokemon table.
  # And the values are from the arguments passed in

  def self.find(id,db) #id => 1, db => <SQLite3::Database:0x0000000002260460>

    info = (db.execute("SELECT * FROM pokemon WHERE id = ?", id)).flatten
    # binding.pry
    new_pokemon = Pokemon.new(id: info[0], name: info[1], type: info[2], db: db)
  end
end
