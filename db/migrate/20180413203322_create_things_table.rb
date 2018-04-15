class CreateThingsTable < ActiveRecord::Migration
  def change
  	create_table :things do |t|
      t.string	:date
      t.string  :title
      t.text  :description
      t.string :user_id
     
 	end
  end
end
