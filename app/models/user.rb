class User < ActiveRecord::Base
  validates :name, :email, :password, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :answers
  has_many :questions, through: :answers

  def self.statuses 
    ['Newbie', 'User', 'Trusted', 'VIP']
  end

  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved
    else 
      super
    end 
  end

  def activate_account!   
    update_attribute :approved, true 
  end
end
