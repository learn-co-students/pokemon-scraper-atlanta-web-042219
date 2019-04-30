require 'pry'

class Pokemon
    attr_accessor :id, :name, :type, :db

    @@pokemon = []

    def initialize(id: , name: , type: , db: )
        @id = id
        @name = name
        @type = type
        @db = db
        self.save unless @id
    end

    def self.save(name, type, db)
        query = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES ( "#{name}", "#{type}" );
        SQL

        db.execute(query)
    end

    def self.find(id, db)
        data = <<-SQL
            SELECT * FROM pokemon
            WHERE id = #{id};
        SQL
        
        new_data = db.execute(data)

        new_data.map do |id, name, type|
            dude = Pokemon.new(id: id, name: name, type: type, db: db)
            return dude
        end
    end

end