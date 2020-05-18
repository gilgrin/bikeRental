class ChangeTypeColumnToCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :bikes, :type, :category
  end
end
