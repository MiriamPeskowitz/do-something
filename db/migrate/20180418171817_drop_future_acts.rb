class DropFutureActs < ActiveRecord::Migration
  def change
  	drop_table :Future_Acts
  end
end
