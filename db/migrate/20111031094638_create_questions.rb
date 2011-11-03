class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.float :complexity
      t.integer :adaptive_test_id

      t.timestamps
    end
  end
end
