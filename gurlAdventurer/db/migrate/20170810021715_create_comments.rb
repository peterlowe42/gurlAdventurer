class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :bodt
      t.integer :user_id
      t.integer :parent_id
      t.boolean :reply

      t.timestamps null: false
    end
  end
end
