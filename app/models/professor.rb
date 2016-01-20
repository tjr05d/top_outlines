class Professor < ActiveRecord::Base
  belongs_to :school
  has_many :outlines

  def full_name
      "#{first_name} #{last_name}"
  end
end
