class Article < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :title, length: {minimum: 3, maximum: 50}
  validates :description, length: {minimum: 10, maximum: 300}
  
end