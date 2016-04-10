class Wine < ActiveRecord::Base
	has_many :ratings, dependent: :destroy
end
