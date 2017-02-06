class Group < ApplicationRecord
  # validates :user_id, uniqueness => true
  has_many :usergroups
end
