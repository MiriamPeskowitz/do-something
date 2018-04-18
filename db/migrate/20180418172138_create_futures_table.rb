class CreateFuturesTable < ActiveRecord::Migration
  def change
  	create_table :futures do |t|
      t.string  :title
      t.string :user_id
   	end
  end
end
