require 'pry'
class Pokemon
	attr_accessor :name, :type, :id, :db, :hp



    #@@all = []
		def initialize(id: , name:, type:, db:)
			@id = id
			@name = name
			@type = type
			@db = db
		
			#binding.pry
		end

			# def self.all
			# 	@@all
			# end
		 def self.save(name,type,db)
		    	db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
		  end

		  def self.find(id, db)
		  	 	pkmn = db.execute("SELECT * FROM pokemon WHERE id = ? ", id).flatten
		  	 	#binding.pry

		  	    new_pokemon = Pokemon.new(id: id ,name: pkmn[1],type: pkmn[2], db: db)
		  	    #binding.pry

		  end
end
