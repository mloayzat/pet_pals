class User < ActiveRecord::Base
validates :email, :presence => true, :uniqueness => true
validates :username, :presence => true, :uniqueness => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :services
  has_many :ratings
  has_many :favorites
  has_many :favorite_places, :through => :favorites, :source => :service
end
