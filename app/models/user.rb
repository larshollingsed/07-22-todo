class User < ActiveRecord::Base
  has_many :items
  validates :name, presence: true
  validates :email, presence: true
end