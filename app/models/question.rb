class Question < ActiveRecord::Base
  validates :content, presence: true
  has_many :answers
  has_many :users, through: :answers
  belongs_to :category
end
