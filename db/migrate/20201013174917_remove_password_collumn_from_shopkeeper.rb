class RemovePasswordCollumnFromShopkeeper < ActiveRecord::Migration[5.2]
  def change
    remove_column :shopkeepers, :password, :string
  end
end
