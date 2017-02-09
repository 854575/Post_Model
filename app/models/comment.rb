class Comment < ApplicationRecord
  before_save :swear_filter

    validates :content,
      presence: true, # not nil
      length: {maximum:200} # 200자 제한
      
    validates :user_id,
      presence: true  # not nil
      
    validates :post_id,
      presence: true  # not nil

    def swear_filter
        self.content.gsub!(/(fuck)|(shit)|(hell)/, "****")
    end
  belongs_to :user
  belongs_to :post
end
