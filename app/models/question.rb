class Question < ActiveRecord::Base
  validates :content, presence: true
  has_many :answers, dependent: :destroy
  has_many :users, through: :answers
  belongs_to :category
end
