class Style < ActiveRecord::Base
	has_many :wines

	def self.sql_find_all
		Style.find_by_sql "SELECT * FROM styles"
	end
end
