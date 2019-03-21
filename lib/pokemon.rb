class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(data)
  end

  def self.all
    @@all
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id)
    data = db.execute("SELECT * FROM Pokemon WHERE Pokemon.id = #{id};")
  end

end
