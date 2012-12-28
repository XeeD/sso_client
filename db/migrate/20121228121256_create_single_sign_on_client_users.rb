class CreateSingleSignOnClientUsers < ActiveRecord::Migration
  def change
    create_table :single_sign_on_client_users do |t|
      t.string :uid, null: false
      t.string :properties, null: false
      t.timestamps
    end

    add_index :single_sign_on_client_users, :uid
  end
end
