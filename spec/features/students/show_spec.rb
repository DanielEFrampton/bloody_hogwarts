require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  before(:each) do
    @harry = Student.create!({
                          name: "Harry Potter",
                          age: "12",
                          house: "Gryffindor"
                        })
    @neville = Student.create!({
                          name: "Neville Longbottom",
                          age: "13",
                          house: "Gryffindor"
                          })
    @draco = Student.create!({
                          name: "Draco Malfoy",
                          age: "14",
                          house: "Slytherin"
                          })

    @astronomy = Course.create({name: "Astronomy"})
    @dark_arts = Course.create({name: 'Defence Against the Dark Arts'})
    @flying = Course.create({name: 'Flying'})
    @herbology = Course.create({name: 'Herbology'})
    @potions = Course.create({name: 'Potions'})
    @transfiguration = Course.create({name: 'Transfiguration'})
    @history = Course.create({name: 'History of Magic'})

    StudentCourse.create({student_id: @harry.id, course_id: @astronomy.id})
    StudentCourse.create({student_id: @harry.id, course_id: @dark_arts.id})
    StudentCourse.create({student_id: @harry.id, course_id: @flying.id})
    StudentCourse.create({student_id: @neville.id, course_id: @astronomy.id})
    StudentCourse.create({student_id: @neville.id, course_id: @herbology.id})
    StudentCourse.create({student_id: @neville.id, course_id: @history.id})
    StudentCourse.create({student_id: @draco.id, course_id: @potions.id})
    StudentCourse.create({student_id: @draco.id, course_id: @dark_arts.id})
    StudentCourse.create({student_id: @draco.id, course_id: @transfiguration.id})
  end

  describe 'When I visit a student show page' do
    it "I see a list for each student of their courses" do
      visit "/students/#{@harry.id}"

      expect(page).to have_content('Astronomy')
      expect(page).to have_content('Defence Against the Dark Arts')
      expect(page).to have_content('Flying')

      visit "/students/#{@neville.id}"
      expect(page).to have_content('Astronomy')
      expect(page).to have_content('Herbology')
      expect(page).to have_content('History of Magic')

      visit "/students/#{@draco.id}"
      expect(page).to have_content('Potions')
      expect(page).to have_content('Defence Against the Dark Arts')
      expect(page).to have_content('Transfiguration')
    end
  end
end
