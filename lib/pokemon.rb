require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize(data)
    data.each do |k, v|
      self.send "#{k}=", v
    end
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    # binding.pry
    new = db.execute("SELECT * FROM pokemon WHERE id = ?",id).flatten
    binding.pry
    data = {id:new[0], name:new[1], type:new[2], db:db}
    binding.pry
    self.new(data)
  end

end
