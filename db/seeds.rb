users = User.create([
  { first_name: 'Admin', last_name: 'Durden', email: 'admin@mail.com', password: '123123', type: 'Admin' },
  { first_name: 'User', last_name: 'Tick', email: 'user@mail.com', password: '123123' }
])

categories = Category.create([
  { title: 'ruby'   },
  { title: 'sql'    },
  { title: 'js'     },
])

tests = Test.create([
  {
    title: 'Test Ruby',
    level: 1,
    category_id: categories[0].id,
    user_id: users[0].id
  },
  {
    title: 'Test SQL',
    level: 1,
    category_id: categories[1].id,
    user_id: users[1].id
  },
  {
    title: 'Test JS',
    level: 1,
    category_id: categories[2].id,
    user_id: users[0].id
  }
])

questions = Question.create([
  { body: 'What operator begins the function description?', test_id: tests[0].id },
  { body: 'What command is used to create the table?', test_id: tests[1].id },
  { body: 'Which tag is used to describe the first level header?', test_id: tests[2].id }
])

# pp tests.map(&:errors)

answers = Answer.create([
  { correct: true, title: 'text 1', question_id: questions[0].id },
  { correct: false, title: 'text 2', question_id: questions[1].id },
  { correct: false, title: 'text 3', question_id: questions[2].id },
  { correct: true, title: 'text 4', question_id: questions[0].id },
  { correct: false, title: 'text 5', question_id: questions[1].id },
  { correct: false, title: 'text 6', question_id: questions[2].id }
])
