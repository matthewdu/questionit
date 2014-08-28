class RemovePointsColumnFromAnswers < ActiveRecord::Migration
  def change
  	remove_column :answers, :points
  end
end
