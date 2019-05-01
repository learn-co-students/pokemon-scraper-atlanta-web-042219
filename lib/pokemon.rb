require "pry"

class Pokemon
	attr_accessor :id, :name, :type, :db, :hp

	def initialize(args)
		args.each {|k, v| self.send("#{k}=", v) }
	end

	def self.save(name, type, db)
		db.execute(%Q[INSERT INTO pokemon(name, type) VALUES("#{name}","#{type}")])
	end

	def self.find(id, db)
		poke = db.execute(%Q[SELECT * FROM pokemon WHERE id = #{id}]).flatten
		self.new(id: poke[0], name: poke[1], type: poke[2], db: db, hp: poke[3])
	end

	def alter_hp(new_hp, db)
		db.execute(%Q[UPDATE pokemon SET hp = #{new_hp} WHERE id = #{self.id}])
	end
end
