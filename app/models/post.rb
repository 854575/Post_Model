class Post < ApplicationRecord
  before_save :swear_filter
  
  validates :title,
    length: {maximum:30,minimum:2}, # 길이 제한치
    presence: true  # not nil
    
  validates :content,
    presence: true  # not nil
    
  def swear_filter
        self.content.gsub!(/(fuck)|(shit)|(hell)/, "****")
  end
  
  belongs_to :user
  has_many :comments
  has_many :likes
end
