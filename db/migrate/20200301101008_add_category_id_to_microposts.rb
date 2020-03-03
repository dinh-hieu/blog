class AddCategoryIdToMicroposts < ActiveRecord::Migration[6.0]
  def change
    add_column :microposts, :category_id, :interger
  end
end
