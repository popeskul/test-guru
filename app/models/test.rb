class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: 'user_id'
  has_many :questions
  has_and_belongs_to_many :users

  def self.find_by_category_title(title)
    Category
      .joins(:tests)
      .where(title: title)
      .order(created_at: :desc)
      .pluck(:title)
  end
end
