class AddPasswordDigest < ActiveRecord::Migration
  def change
    remove_column :teachers, :password
    add_column :teachers, :password_digest, :string
  end
end
