class DropTableTestsUsers < ActiveRecord::Migration[6.1]
  def down; end

  def up
    drop_table :tests_users, if_exists: true
  end
end
