class AddTitleToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :title, :text
    add_column :posts, :age_type, :integer
    add_column :posts, :category, :integer
  end
end
