class AddTypeToAllTests < ActiveRecord::Migration
  def change
    add_column :all_tests, :type, :string
  end
end
