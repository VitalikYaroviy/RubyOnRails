class AddPostFieldStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :status, :boolean
  end
end
