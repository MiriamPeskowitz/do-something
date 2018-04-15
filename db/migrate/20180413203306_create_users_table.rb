class CreateUsersTable < ActiveRecord::Migration
  def change
  	  t.string  :username
      t.string  :email
      t.string  :password_digest
      t.string :user_id
      t.timestamps 
  end
end
