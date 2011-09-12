class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :address
      t.string :tel
      t.string :email
      t.string :hostname
      t.integer :user_id

      t.timestamps
    end
  end
end
