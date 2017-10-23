class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3, maximum: 50 } #validates if the user has entered title or not
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end 