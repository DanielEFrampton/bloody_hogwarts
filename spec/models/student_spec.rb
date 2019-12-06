require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'methods' do
    it 'can return average age of all students up to two decimals' do
      bob = Student.create!({name: "Bob", age: "1", house: "None"})
      bill = Student.create!({name: "Bill", age: "2", house: "None"})
      suzie = Student.create!({name: "Suzie", age: "3", house: "None"})

      expect(Student.average_age).to eq(2)

      jorge = Student.create!({name: "Jorge", age: "5", house: "None"})

      expect(Student.average_age).to eq(2.75)
    end
  end
end
