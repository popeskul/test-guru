class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.find_by_category_title (category_title)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
        .where('categories.title = ?', category_title)
        .order('tests.title DESC')
        .pluck('tests.title')
  end
end
