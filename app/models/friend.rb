class Friend < ApplicationRecord
  belongs_to :user1_id, class_name: "User"
  belongs_to :user2_id, class_name: "User"
end
