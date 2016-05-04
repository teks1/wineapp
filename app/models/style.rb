class Style < ActiveRecord::Base
	has_many :wines

	def self.sql_find_all
		Style.find_by_sql "SELECT * FROM styles"
	end

	def self.sql_find_by_id(id)
		Style.find_by_sql(["SELECT * FROM styles WHERE style_id = ?", id]).first
	end

	def sql_update(params)
		Style.find_by_sql ["UPDATE styles SET name = ?, description = ? WHERE style_id = ?", params[:name], params[:description], self.id]
	end

end
