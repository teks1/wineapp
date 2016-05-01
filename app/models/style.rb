class Style < ActiveRecord::Base
	has_many :wines

	def self.sql_find_all
		Style.find_by_sql "SELECT * FROM styles"
	end

	def self.sql_find_by_id(id)
		Style.find_by_sql("SELECT * FROM styles where style_id = #{id}").first
	end

	def self.sql_update(id, params)
		Style.find_by_sql "UPDATE styles SET name = '#{params[:name]}', description = '#{params[:description]}' WHERE style_id = #{id}"
	end

	def self.validate_parameters(params)
		params[:name].present?
	end

end
