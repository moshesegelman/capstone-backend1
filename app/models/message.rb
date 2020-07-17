class Message < ApplicationRecord
  validates :text, presence: true

  belongs_to :user
  belongs_to :conversation, optional: true 
  belongs_to :channel, optional: true 
end
