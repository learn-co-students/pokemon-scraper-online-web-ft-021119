class Pokemon
    attr_accessor :id, :name, :type, :db
@@all = []

    def initialize(id:, name:, type:, db:) #, name, type, db)
        @id = id
        @name = name
        @type = type
        @db = db
        @@all << self
    end

    def self.all
        @@all
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
        #db used to be 'database_connection'
    end
    def self.find(id_number, db)
        pokemon_stats = db.execute("SELECT * FROM pokemon WHERE id=?", id_number).flatten;
        Pokemon.new(id:pokemon_stats[0], name:pokemon_stats[1], type:pokemon_stats[2], db:db) 
        #self.id
        #  expect(pikachu_from_db.id).to eq(1)
        #  expect(pikachu_from_db.name).to eq("Pikachu")
        #  expect(pikachu_from_db.type).to eq("electric")
        #self.pokemon.id
        
        #binding.pry
        #binding.pry

    end


end
