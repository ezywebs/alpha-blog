class Article < ActiveRecord::Base
  validates :title, length: {minimum: 3, maximum: 50}
  validates :description, length: {minimum: 10, maximum: 300}
  
end