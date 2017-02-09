class User < ApplicationRecord
  before_save :make_name_capital

    validates :name,
      presence: true, # not nil
      length: {maximum: 10} # 길이 제한
      
    validates :age,
      presence: true, # not nil
      numericality: {only_integer: true, greater_than_or_equal_to: 20, less_than: 30} # not nil
      
    validates :mail,
      presence: true, # not nil
      uniqueness: true, # 중복 방지
      format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i } # 이메일 형식 체크
  
    def make_name_capital
        self.name.capitalize!
    end
  
  has_many :usergroups
  has_many :comments
  has_many :posts
  has_many :likes
end
