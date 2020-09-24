class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :email
      t.string :license
      t.integer :years_of_experience
      t.references :specialty, null: false, foreign_key: true
      t.text :info
      t.text :address
      t.string :avatar
      t.string :phone

      t.timestamps
    end
  end
end
