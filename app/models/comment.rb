class Comment < ApplicationRecord
  belongs_to :whispr
  belongs_to :user
  acts_as_votable
end
