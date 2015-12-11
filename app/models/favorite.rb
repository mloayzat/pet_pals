class Favorite < ActiveRecord::Base

	validates :user_id, :presence => true
	validates :service_id, :presence => true

	belongs_to :service
	belongs_to :user


end
