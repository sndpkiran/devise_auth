class AddForeignKeys < ActiveRecord::Migration
  def change
  	add_foreign_key	:user_details, :users
  end
end
