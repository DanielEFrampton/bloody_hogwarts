# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

harry = Student.create!({
                      name: "Harry Potter",
                      age: "12",
                      house: "Gryffindor"
                    })
neville = Student.create!({
                      name: "Neville Longbottom",
                      age: "13",
                      house: "Gryffindor"
                      })
draco = Student.create!({
                      name: "Draco Malfoy",
                      age: "14",
                      house: "Slytherin"
                      })

astronomy = Course.create({name: "Astronomy"})
dark_arts = Course.create({name: 'Defence Against the Dark Arts'})
flying = Course.create({name: 'Flying'})
herbology = Course.create({name: 'Herbology'})
potions = Course.create({name: 'Potions'})
transfiguration = Course.create({name: 'Transfiguration'})
history = Course.create({name: 'History of Magic'})

StudentCourse.create({student_id: harry.id, course_id: astronomy.id})
StudentCourse.create({student_id: harry.id, course_id: dark_arts.id})
StudentCourse.create({student_id: harry.id, course_id: flying.id})
StudentCourse.create({student_id: neville.id, course_id: astronomy.id})
StudentCourse.create({student_id: neville.id, course_id: herbology.id})
StudentCourse.create({student_id: neville.id, course_id: history.id})
StudentCourse.create({student_id: draco.id, course_id: potions.id})
StudentCourse.create({student_id: draco.id, course_id: dark_arts.id})
StudentCourse.create({student_id: draco.id, course_id: transfiguration.id})
