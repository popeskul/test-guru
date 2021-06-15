class AddBodyAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :title, :string
  end
end
