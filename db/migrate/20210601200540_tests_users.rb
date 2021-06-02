class TestsUsers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :tests, :users do |t|
      t.foreign_key :users, index: true
      t.foreign_key :tests, index: true

      t.timestamps
    end
  end
end
