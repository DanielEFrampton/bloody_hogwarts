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

  describe "When I visit '/courses'" do
    it "I see a list of courses in alphabetical order and the number of students enrolled" do
      visit '/courses'

      expect(page).to have_content("#{@astronomy.name}: #{@astronomy.student_count}")
      expect(page.body.index(@astronomy.name)).to be < page.body.index(@dark_arts.name)
      expect(page).to have_content("#{@dark_arts.name}: #{@dark_arts.student_count}")
      expect(page.body.index(@dark_arts.name)).to be < page.body.index(@flying.name)
      expect(page).to have_content("#{@flying.name}: #{@flying.student_count}")
      expect(page.body.index(@flying.name)).to be < page.body.index(@herbology.name)
      expect(page).to have_content("#{@herbology.name}: #{@herbology.student_count}")
      expect(page.body.index(@herbology.name)).to be < page.body.index(@history.name)
      expect(page).to have_content("#{@history.name}: #{@history.student_count}")
      expect(page.body.index(@history.name)).to be < page.body.index(@potions.name)
      expect(page).to have_content("#{@potions.name}: #{@potions.student_count}")
      expect(page.body.index(@potions.name)).to be < page.body.index(@transfiguration.name)
      expect(page).to have_content("#{@transfiguration.name}: #{@transfiguration.student_count}")
    end

    it "I see list of names of each student enrolled in each course below that course" do
      visit '/courses'
      within "#course-#{@astronomy.id}" do
        expect(page).to have_content(@harry.name)
      end
    end
  end
end
