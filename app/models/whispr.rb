class Whispr < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :whispr_files, UserWhisprUploader

end
