class AddPasswordDigestToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :phone, :string
    add_column :users, :age, :integer
    add_column :users, :location, :text
    add_column :users, :avatar, :string
    add_column :users, :sex, :string
  end
end
