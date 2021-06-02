class Test < ApplicationRecord
  def self.find_by_category_title (category_title)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
        .where('categories.title = ?', category_title)
        .order('tests.title DESC')
        .pluck('tests.title')
  end
end
