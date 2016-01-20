class CreateUserDetails < ActiveRecord::Migration
  def up
    create_table :user_details do |t|
    	t.references :user
    	t.string "fname", null: false, length: 255
    	t.string "lname", length: 255
    	t.date "dob", null: false
    	t.string "gender", default: :null
      t.timestamps null: false
    end
  end

  def down
  	drop_table :user_details
  end

end
