class Comment < ApplicationRecord
    belongs_to :post
	belongs_to :user
    def commentter
        self.user ? user.email : 'Unknown'
    end
end
