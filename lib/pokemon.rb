class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

<<<<<<< HEAD
  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", name, type)
=======
  def save(name, type, id)
    @name = name
    @type = type
    @id = id
    @@all<< self
>>>>>>> e8de547b8836f94d282381fa4ffc1fb6ec18b444
  end

  def self.find(id)
    self.new(db.execute("SELECT name* FROM Pokemon WHERE Pokemon.id = 'id';"))
  end

end
