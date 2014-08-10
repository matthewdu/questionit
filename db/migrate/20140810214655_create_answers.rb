class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.string :title
    	t.text :post
    	t.integer :points

    	t.timestamps
    end
  end
end
