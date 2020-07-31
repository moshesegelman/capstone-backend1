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

  def pending_friends
    friend = Friend.where("user1_id = ? OR user2_id = ?", id, id).where(pending: true)
    friend.map do |f|
      if f.user1_id == id
        {id: f.id, sender_id: f.user1_id, user: f.user2}
      else
        {id: f.id, sender_id: f.user1_id, user: f.user1}
      end
    end
  end
  def friends
    friend = Friend.where("user1_id = ? OR user2_id = ?", id, id).where(pending: false)
    friend.map do |f|
      if f.user1_id == id
        {id: f.id,  user: f.user2}
      else
        {id: f.id,   user: f.user1}
      end
    end
  end

end
