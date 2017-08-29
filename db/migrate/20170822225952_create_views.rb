class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.integer :user_id
      t.string :ip_address
      t.references :viewable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
