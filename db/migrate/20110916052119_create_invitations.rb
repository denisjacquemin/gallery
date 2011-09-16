class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :email
      t.string :hash
      t.integer :agency_id

      t.timestamps
    end
  end
end
