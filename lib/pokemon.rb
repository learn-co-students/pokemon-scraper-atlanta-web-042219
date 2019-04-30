class Pokemon

attr_accessor :id, :name, :type, :db

  def initialize(options={})
    @id = options['id']
    @name = options['name']
    @type = options['type']
    @db = options['db']
  end

  def self.save(name, type, db)
    save_p = db.prepare('INSERT INTO pokemon(name, type) VALUES (?,?)')
    save_p.execute(name, type)
  end

  def self.find(id, db)
     found_p = db.execute('SELECT * FROM pokemon WHERE id = id').flatten
        Pokemon.new({'id' => found_p[0], 'name' => found_p[1], 'type' => found_p[2], 'db' => db})
  end
end
