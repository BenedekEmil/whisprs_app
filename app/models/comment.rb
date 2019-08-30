class Comment < ApplicationRecord
  belongs_to :whispr
  belongs_to :user
end
