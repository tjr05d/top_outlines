class Outline < ActiveRecord::Base
  has_many :purchases
  belongs_to :course
  belongs_to :user
  has_attached_file :attachment, styles: {thumb: ["300x300#", :png]}
  validates_attachment :attachment, content_type: { content_type: "application/pdf" }
  validates :title,
            presence: true
  validates :course_id,
            presence: true
  validates :school_id,
            presence: true

  def cart_action(current_user_id)
    if $redis.sismember "cart#{current_user_id}", id
      "Remove from"
    else
      "Add to"
    end
  end
end
