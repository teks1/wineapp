class Style < ActiveRecord::Base
	has_many :wines

	def self.sql_find_all
		Style.find_by_sql "SELECT * FROM styles"
	end

	def self.sql_find_by_id(id)
		Style.find_by_sql("SELECT * FROM styles where style_id = #{id}").first
	end

end
