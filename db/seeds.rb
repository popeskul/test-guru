# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  { name: 'Tyler'     },
  { name: 'Adam'      },
  { name: 'Elizabeth' },
  { name: 'Sandy'     }
])

categories = Category.create([
  { title: 'ruby'   },
  { title: 'sql'    },
  { title: 'html'   },
  { title: 'css'    },
  { title: 'js'     },
  { title: 'js some'}
])

tests = Test.create([
  { title: 'Синтаксис Ruby 1', level: 1, category_id: categories[0].id },
  { title: 'Синтаксис SQL', level: 1, category_id: categories[1].id },
  { title: 'Синтаксис HTML', level: 5, category_id: categories[2].id },
  { title: 'Синтаксис CSS', level: 5, category_id: categories[3].id },
  { title: 'Синтаксис JS', level: 3, category_id: categories[4].id }
])

questions = Question.create([
  { body: 'What operator begins the function description?', test_id: tests[0].id },
  { body: 'What command is used to create the table?', test_id: tests[1].id },
  { body: 'Which tag is used to describe the first level header?', test_id: tests[2].id }
])

answers = Answer.create([
  { correct: true, question_id: questions[0].id },
  { correct: false, question_id: questions[1].id },
  { correct: false, question_id: questions[2].id },
  { correct: true, question_id: questions[0].id },
  { correct: false, question_id: questions[1].id },
  { correct: false, question_id: questions[2].id }
])

# sorted in descending order an array of names of all Tests in which the Category is named in a certain way
Test.find_by_category_title('ruby')

# a list of all Tests that the User passes or has ever passed at this difficulty level
users.first.find_by_level(1)
