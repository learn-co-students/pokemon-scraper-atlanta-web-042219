class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(options = {})
    @id = options[:id]
    @name = options[:name]
    @type = options[:type]
    @db = options[:db]
    @hp = options[:hp]
  end

  def self.save(name, type, db)
    query = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES ("#{name}","#{type}")
      SQL
      db.execute(query)
    end

    def self.find(id, db)
      query = <<-SQL
        SELECT * FROM pokemon
        WHERE id = #{id}
        SQL
      poke_info = db.execute(query).flatten
      poke_hash = { id: poke_info[0], name: poke_info[1], type: poke_info[2], db: db, hp: poke_info[3]}
      Pokemon.new(poke_hash)
    end

    def alter_hp(hp, db)
      query = <<-SQL
      UPDATE pokemon SET hp = #{hp}
      WHERE id = #{self.id}
      SQL
      db.execute(query)
    end

end
