class RemoveLastNameFromUsers < ActiveRecord::Migration[5.2]
  def self.up
    remove_column :users, :lastName
  end

  def self.down
    add_column :users, :last_name, :string
  end
end
