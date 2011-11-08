class CreateLearningPlans < ActiveRecord::Migration
  def change
    create_table :learning_plans do |t|
      t.integer :adaptive_test_id
      t.integer :user_id

      t.timestamps
    end
  end
end
