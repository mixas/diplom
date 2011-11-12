class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :learning_plan_id
      t.time :passing_time

      t.timestamps
    end
  end
end
