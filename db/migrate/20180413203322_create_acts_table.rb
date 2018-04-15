class CreateActsTable < ActiveRecord::Migration
  def change
  	create_table :acts do |t|
      t.string	:date
      t.string  :title
      t.text  :description
      t.string :user_id
      t.timestamps
 	end
  end
end
