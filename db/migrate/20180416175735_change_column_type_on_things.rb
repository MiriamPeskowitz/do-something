class ChangeColumnTypeOnThings < ActiveRecord::Migration
  def change
  	  change_column :things, :user_id, :integer
  end
end