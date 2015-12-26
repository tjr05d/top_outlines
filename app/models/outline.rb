class Outline < ActiveRecord::Base
  has_many :purchases
  belongs_to :course
  belongs_to :user
  has_attached_file :attachment, styles: {thumb: ["600x600#", :png]}
  validates_attachment :attachment, content_type: { content_type: "application/pdf" }
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
