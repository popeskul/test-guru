class AddStartTimeEndTimeToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :start_time, :datetime
    add_column :test_passages, :end_time, :datetime
  end
end
