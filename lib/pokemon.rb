# require 'pry'
# class Pokemon
#     attr_accessor :id, :name, :type, :hp, :db

#     def initialize(options={})
#         @id = options[:id]
#         @name = options[:name]
#         @type = options[:type]
#         @hp = options[:hp]
#         @db = options[:db]
#     end

#     def self.save(name, type, db)
#         db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
#     end

#     def self.find(id_num, db)
#         find = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
#         hash = {id: find[0], name: find[1], type: find[2], hp: find[3], db: db}
#         Pokemon.new(hash)
#     end

#     def alter_hp(new_hp, db)
#         db.execute("UPDATE pokemon SET hp = ? WHERE id = ?)", new_hp, self.id)
#     end

# end

class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(options={})
        @id = options[:id]
        @name = options[:name]
        @type = options[:type]
        @db = options[:db]
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id_num, db)
        find = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
        hash = {id: find[0], name: find[1], type: find[2], db: db}
        Pokemon.new(hash)
    end

end