class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name
      t.string :last_name
    	t.string :username
      t.string :email
      t.string :avatar
      t.string :password_digest
      t.boolean :admin, default: false
      t.integer :itf
      t.integer :utr
      t.integer :ntr
      t.boolean :righthanded, default: true
      t.boolean :double_handed_backhand, default: true
      t.decimal :height
      t.decimal :weight
      t.integer :sat
      t.integer :toefl
      t.integer :act
      t.date :birthday
      t.text :about

      t.string :first_name_en
      t.string :last_name_en
      t.decimal :gpa
      t.string :academy
      t.string :country
      t.string :city
      t.string :skype
      # study_of_interest
      # season_applying (Fall, 2017)
      # coach
      # skype

      t.timestamps null: false
    end
  end
end
