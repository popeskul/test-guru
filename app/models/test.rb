class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: 'user_id'
  has_many :questions
  has_and_belongs_to_many :users

  def self.find_by_category_title(title)
    self.joins(:category)
      .where(title: title)
      .order('tests.title DESC')
      .pluck('tests.title')
  end
end
