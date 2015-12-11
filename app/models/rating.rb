class Rating < ActiveRecord::Base

	validates :user_id, :presence => true
	validates :service_id, :presence => true
	validates :content, :presence => true
	validates :average_rating, :presence => true

belongs_to :service
belongs_to :user




end
