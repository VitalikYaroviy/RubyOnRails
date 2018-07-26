class AddPostFields < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :priority, :integer
    add_column :posts, :dueDate, :date
  end
end
