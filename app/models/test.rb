class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: 'user_id'
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  scope :by_level, -> (level) { where(level: level) }
  scope :easy, -> { by_level(1) }
  scope :intermediate, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }

  scope :by_category_title, -> (title) { joins(:category).where('categories.title = :title', title: title) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }, uniqueness: { scope: :title }

  def self.by_title(title)
    Test
      .by_category_title(title)
      .order(title: :desc)
      .pluck(:title)
  end
end
