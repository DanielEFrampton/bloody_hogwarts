class Student <ApplicationRecord
  validates_presence_of :name, :age, :house
  has_many :student_courses
  has_many :courses, through: :student_courses

  def self.average_age
    (all.sum(:age) / all.count.to_f).round(2)
  end
end
