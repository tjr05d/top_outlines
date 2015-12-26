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

  def self.price_audit
    @schools = School.all
    @courses = Course.all
#iterate through every school
    @schools.each do |school|
#iterate through every course at the school
      @courses.each do |course|
#select the outlines for each course and sort them by sales
        @outlines = Outline.where(school_id: school.id, course_id: course.id)
#check to see if the course has any outlines, else sort the array by sales
        if @sorted_outlines.nil?
          break
        else
          @sorted_outlines = @outlines.sort_by { |outline| outline["sales"]}
#reverse that array to make it highest sales to lowest
          @sorted_outlines.reverse!.each do |outline|
#set the top outlines price to 20 dollars, the 2nd's price to 15, the 3rd's to 10 and the rest to 5 dollars, save to commit the transaction
            if outline == @sorted_outlines[0]
              outline.price = "20"
              outline.save
            elsif outline == @sorted_outlines[1]
              outline.price = "15"
              outline.save
            elsif outline == @sorted_outlines[2]
              outline.price = "10"
              outline.save
            else
              outline.price = "5"
              outline.save
            end
          end
        end
      end
    end
  end

end
