class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates :name, presence: true
  validates :content, presence: true
end