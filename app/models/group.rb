class Group < ApplicationRecord
  validates :name,
    uniqueness: true, # 중복 제한
    presence: true, # not nil
    length: {maximum: 20} # 길이 제한
  has_many :usergroups
end
