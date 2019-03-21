class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id)
    self.new(db.execute("SELECT name* FROM Pokemon WHERE Pokemon.id = 'id';"))
  end

end
