class Whispr < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  scope :of_followed_users, -> (following_users) { where user_id: following_users }
  mount_uploader :whispr_files, UserWhisprUploader
  acts_as_votable
end
