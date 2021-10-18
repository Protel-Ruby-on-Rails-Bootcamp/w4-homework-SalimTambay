class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  scope :availables, -> { where(visible: true) }
end
