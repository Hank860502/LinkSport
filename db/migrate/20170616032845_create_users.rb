class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name
      t.string :last_name
    	t.string :username
      t.string :email
      t.string :image, :default_url => "/missing_avatar.jpg"
      t.string :password_digest
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
