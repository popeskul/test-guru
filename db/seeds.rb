users = User.create([
  { name: 'Tyler', email: 'test1@test.com', password: '123123' },
  { name: 'Adam', email: 'test2@test.com', password: '123123' },
  { name: 'Elizabeth', email: 'test3@test.com', password: '123123' },
  { name: 'Sandy', email: 'test4@test.com', password: '123123' }
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
  {
    title: 'Синтаксис Ruby 1',
    level: 1,
    category_id: categories[0].id,
    author: users[0]
  },
  {
    title: 'Синтаксис SQL',
    level: 1,
    category_id: categories[1].id,
    author: users[1]
  },
  {
    title: 'Синтаксис HTML',
    level: 5,
    category_id: categories[2].id,
    author: users[2]
  },
  {
    title: 'Синтаксис CSS',
    level: 5,
    category_id: categories[3].id,
    author: users[3]
  },
  {
    title: 'Синтаксис JS',
    level: 3,
    category_id: categories[4].id,
    author: users[1],
    users: [users[0], users[2]]
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
