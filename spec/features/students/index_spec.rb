require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  before(:each) do
    @harry = Student.new({
                          name: "Harry Potter",
                          age: "12",
                          house: "Gryffindor"
                        })
    @neville = Student.new({
                          name: "Neville Longbottom",
                          age: "13",
                          house: "Gryffindor"
                          })
    @draco = Student.new({
                          name: "Draco Malfoy",
                          age: "14",
                          house: "Slytherin"
                          })
  end

  describe "When I visit '/students'" do
    it "I see a list of students with their name, age, and house" do
      visit '/students'

      expect(page).to have_content(@harry.name)
      expect(page).to have_content(@harry.age)
      expect(page).to have_content(@harry.house)

      expect(page).to have_content(@neville.name)
      expect(page).to have_content(@neville.age)
      expect(page).to have_content(@neville.house)
      
      expect(page).to have_content(@draco.name)
      expect(page).to have_content(@draco.age)
      expect(page).to have_content(@draco.house)
    end
  end
end
