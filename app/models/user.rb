class User < ActiveRecord::Base
  include BCrypt
  
  has_many :items
  validates :name, presence: true
  validates :email, presence: true
  
  
  def encrypt_password(unencrypted_password)
    self.password = BCrypt::Password.create(unencrypted_password)
  end
    
end