class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true 
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :channels
  has_many :messages , dependent: :destroy
  
  def conversations
    Conversation.where("sender_id = ? OR recipient_id = ?", id, id)
  end
end
