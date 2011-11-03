class CreateAdaptiveTests < ActiveRecord::Migration
  def change
    create_table :adaptive_tests do |t|
      t.string :title

      t.timestamps
    end
  end
end
