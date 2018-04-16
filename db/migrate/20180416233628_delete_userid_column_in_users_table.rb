class DeleteUseridColumnInUsersTable < ActiveRecord::Migration
  def change
  	remove_column :Users, :user_id, :string
  end
end
