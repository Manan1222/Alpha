class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3, maximum: 50 } #validates if the user has entered title or not
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true #it ensures that whenever we create a article a USER_ID is present
end 