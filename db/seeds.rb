users = User.create([
  { first_name: 'Admin', last_name: 'Durden', email: 'popeskul.front@gmail.com', password: '123123', type: 'Admin' },
  { first_name: 'User', last_name: 'Tick', email: 'peterjob91@gmail.com', password: '123123' }
])

categories = Category.create([
  { title: 'ruby'   },
  { title: 'sql'    },
  { title: 'js'     },
])

tests = Test.create([
  {
    title: 'Test Ruby, level 1',
    level: 1,
    category_id: categories[0].id,
    user_id: users[0].id
  },
  {
    title: 'Test SQL, level 2',
    level: 2,
    category_id: categories[1].id,
    user_id: users[1].id
  },
  {
    title: 'Test JS, level 3',
    level: 3,
    category_id: categories[2].id,
    user_id: users[0].id
  },
  {
    title: 'Test JS, level 3 --- 2',
    level: 3,
    category_id: categories[2].id,
    user_id: users[0].id
  },
  {
    title: 'Test JS, level 4 --- 1',
    level: 4,
    category_id: categories[2].id,
    user_id: users[0].id
  },
  {
    title: 'Test JS, level 4 --- 2',
    level: 4,
    category_id: categories[2].id,
    user_id: users[0].id
  }
])

questions = Question.create([
  { body: 'What operator begins the function description?', test_id: tests[0].id },
  { body: 'What command is used to create the table?', test_id: tests[1].id },
  { body: 'Which tag is used to describe the first level header?', test_id: tests[2].id },
  { body: 'Which tag is used to describe the first level header?', test_id: tests[3].id },
  { body: 'Which tag is used to describe the first level header?', test_id: tests[4].id },
  { body: 'Which tag is used to describe the first level header?', test_id: tests[5].id }
])

# pp tests.map(&:errors)

answers = Answer.create([
  { correct: true, title: 'text 1', question_id: questions[0].id },
  { correct: true, title: 'text 2', question_id: questions[1].id },
  { correct: true, title: 'text 3', question_id: questions[2].id },
  { correct: true, title: 'text 4', question_id: questions[3].id },
  { correct: true, title: 'text 5', question_id: questions[4].id },
  { correct: true, title: 'text 6', question_id: questions[5].id },
])

Badge.create([
   {
     title: 'all_tests_at_category ruby',
     badge_type: 'all_tests_at_category',
     parameter: 'ruby',
     image_url: 'diamond'
   },
   {
     title: 'passing_test_at_first_attempt',
     badge_type: 'passing_test_at_first_attempt',
     parameter: 'passing_test_at_first_attempt',
     image_url: 'check-circle'
   },
   {
     title: 'all_tests_at_level 1',
     badge_type: 'all_tests_at_level',
     parameter: 1,
     image_url: 'check-circle-fill'
   }
 ])
