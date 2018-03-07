class User < ActiveRecord::Base
  validates :username,  length: { minimum: 3, maximum: 25 }, 
                        uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i                
  validates :email,     length: { maximum: 105}, 
                        uniqueness: { case_sensitive: false },
                        format: { with: VALID_EMAIL_REGEX }
end