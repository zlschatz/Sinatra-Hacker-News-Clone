 :class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, uniqueness: true, null: false
      t.string :email, uniqueness: true, null: false
      t.string :password_hash, null: false
      t.string :about

      t.timestamps null: false
    end
  end
end
