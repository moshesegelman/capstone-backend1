class Channel < ApplicationRecord
  validates :name, presence: true

  belongs_to :subject
  belongs_to :user
  has_many :messages, dependent: :destroy
end
