class CreateFutureActsTable < ActiveRecord::Migration
  def change
  	create_table :Future_Acts do |t|
      t.string	:title
      t.string :user_id
    end 
  end
end
