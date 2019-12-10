class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :facebook_id, :string
  end
end
