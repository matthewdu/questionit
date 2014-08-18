class RenameAnswersColumnPostToContent < ActiveRecord::Migration
  def change
  	rename_column :answers, :post, :content
  end
end
