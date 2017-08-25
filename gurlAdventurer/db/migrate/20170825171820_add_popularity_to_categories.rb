class AddPopularityToCategories < ActiveRecord::Migration
  def change
  	add_column :categories, :popularity, :decimal, default: 0.0
  	add_column :categories, :last_decay, :datetime
  end
end
