class Outline < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  mount_uploader :attachment,
                AttachmentUploader
  validates :title,
            presence: true 
end
