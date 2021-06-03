class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :created_tests, class_name: 'Test'

  def find_by_level(level)
    tests.where(level: level)
  end
end
