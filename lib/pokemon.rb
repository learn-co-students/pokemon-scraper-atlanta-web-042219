require 'pry'

class Pokemon
    attr_accessor :id, :name, :type, :db, :hp 

    def initialize (pokemon = {})
        @id = pokemon[:id]
        @name = pokemon[:name]
        @type = pokemon[:type]
        @db = pokemon[:db]
        @hp = pokemon[:hp]
    end

    def self.save(name, type, db)
        query = <<-SQL
        INSERT INTO pokemon (name, type) VALUES ("#{name}", "#{type}")
        SQL
        db.execute(query)
    end

    def self.find(id, db)
        query1 = db.execute("SELECT * FROM pokemon WHERE id = #{id}").flatten
        options = {id: query1[0], name: query1[1], type: query1[2], hp: query1[3]}
        Pokemon.new(options)
    end

    def alter_hp(new_hp, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    end

end
