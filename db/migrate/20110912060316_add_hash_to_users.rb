class AddHashToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hash, :string
  end
end
