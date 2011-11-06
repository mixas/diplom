class AddRightToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :right, :boolean
  end
end
