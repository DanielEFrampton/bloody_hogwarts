require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe 'methods' do
    it "can return total number of students associated with course" do
      bob = Student.new({name: "Bob", age: "1", house: "None"})
      bill = Student.new({name: "Bill", age: "1", house: "None"})
      suzie = Student.new({name: "Suzie", age: "1", house: "None"})
      potions = Course.new({name: "Potions"})

      expect(potions.student_count).to eq(0)

      StudentCourse.new({student_id: bob.id, course_id: potions.id})

      expect(potions.student_count).to eq(1)

      StudentCourse.new({student_id: bill.id, course_id: potions.id})

      expect(potions.student_count).to eq(2)

      StudentCourse.new({student_id: suzie.id, course_id: potions.id})

      expect(potions.student_count).to eq(3)
    end
  end
end
