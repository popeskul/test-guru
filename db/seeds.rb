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

Test.create!([
  { title: 'Синтаксис Ruby 1', level: 1, category_id: categories[0].id },
  { title: 'Синтаксис SQL', level: 1, category_id: categories[1].id },
  { title: 'Синтаксис HTML', level: 5, category_id: categories[2].id },
  { title: 'Синтаксис CSS', level: 5, category_id: categories[3].id },
  { title: 'Синтаксис JS', level: 3, category_id: categories[4].id }
])
