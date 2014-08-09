class AddUserColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :duser, :string
    add_column :users, :password_digest, :string
  end
end
