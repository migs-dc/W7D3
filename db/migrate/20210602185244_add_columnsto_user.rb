class AddColumnstoUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :password_digest, :string, null: false

    add_index :users, :password_digest
  end
end
