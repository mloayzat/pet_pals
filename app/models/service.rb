class Service < ActiveRecord::Base

  validates :description, :presence => true, :uniqueness => true 
  validates :phone, :presence => true, :uniqueness => true
  validates :address, :presence => true, :uniqueness => true
  validates :name, :presence => true, :uniqueness => true
  validates :category, :presence => true
  validates :image, :presence => true, :uniqueness => true
  validates :user_id, :presence => true


	belongs_to :user
	has_many :ratings
	has_many :favorites
	has_many :fans, :through => :favorites, :source => :user


end
