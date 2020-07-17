class Subject < ApplicationRecord
  has_many :channels, dependent: :destroy
end
