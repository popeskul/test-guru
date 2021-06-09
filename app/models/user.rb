class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :created_tests, class_name: 'Test'

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def find_by_level(level)
    tests.by_level(level)
  end
end
