class Outline < ActiveRecord::Base
  has_many :purchases
  belongs_to :course
  belongs_to :user
  mount_uploader :attachment,
                AttachmentUploader
  validates :title,
            presence: true

  def cart_action(current_user_id)
    if $redis.sismember "cart#{current_user_id}", id
      "Remove from"
    else
      "Add to"
    end
  end
end
