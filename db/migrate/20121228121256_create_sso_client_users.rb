class CreateSSOClientUsers < ActiveRecord::Migration
  def change
    create_table :sso_client_users do |t|
      t.string :uid, null: false
      t.string :properties, null: false
      t.timestamps
    end

    add_index :sso_client_users, :uid
  end
end
