require 'pry'
class Pokemon
attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
  @id = id
  @name = name
  @type = type
  @db = db
  end

  def self.save(name, type, db)
    query = <<-END
      INSERT INTO pokemon(name, type)
      VALUES("#{name}", "#{type}")
    END
    db.execute(query)
  end

  def self.find(id, db)
    query = <<-end
    SELECT * FROM pokemon WHERE pokemon.id = #{id}
    end
    data = db.execute(query).flatten
    Pokemon.new(id: data[0], name: data[1], type: data[2], db: db)
  end
end
