class AddPopularityToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :popularity, :decimal, default: 0.0
  	add_column :articles, :last_decay, :datetime
  end
end
