class AddDeleteStatusToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :statusDelete, :boolean
  end
end
