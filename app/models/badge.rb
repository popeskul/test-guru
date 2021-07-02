class Badge < ApplicationRecord
  RULE_TYPES = %i[all_tests_at_category passing_test_at_first_attempt all_tests_at_level]

  has_many :user, through: :user_badges
  has_many :test, through: :user_badges
  has_many :user_badges

  validates :title, presence: true
  validates :badge_type, presence: true
  validates :image_url, presence: true

  attr_accessor :types

  def self.badge_types
    @types = RULE_TYPES
  end
end