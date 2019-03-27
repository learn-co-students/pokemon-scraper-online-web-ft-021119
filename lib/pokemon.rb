require 'pry'
class Pokemon
  attr_accessor :name, :type, :id, :db 
  
  def initialize (attributes)
  end 
  
  def self.save(name, type, db)
    sql =<<-SQL
    INSERT INTO pokemon (name, type)
    VALUES(?,?)
    SQL
   # binding.pry 
    db.execute(sql, name, type)
  end 
  
  def self.find(id, db)
    sql =<<-SQL
    SELECT * FROM pokemon WHERE id = "#{id}"
    SQL
    row = db.execute(sql)
    new_pokemon = self.new(row)
    new_pokemon.name = row[0][1]
    new_pokemon.type = row[0][2]
    new_pokemon.id = row[0][0]
    new_pokemon 
   # binding.pry 
    
  end 
end
