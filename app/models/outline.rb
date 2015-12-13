class Outline < ActiveRecord::Base
  has_many :purchases
  belongs_to :course
  belongs_to :user
  mount_uploader :attachment,
                AttachmentUploader
  validates :title,
            presence: true
end
