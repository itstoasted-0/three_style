class RemoveSexToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :sex, :string
  end
end
