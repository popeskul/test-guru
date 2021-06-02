class TestsUsers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :tests, :users do |t|
      t.foreign_key :users
      t.foreign_key :tests

      t.timestamps
    end
  end
end
