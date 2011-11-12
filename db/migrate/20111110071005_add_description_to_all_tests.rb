class AddDescriptionToAllTests < ActiveRecord::Migration
  def change
    add_column :all_tests, :description, :string
  end
end
