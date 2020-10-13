class AddPasswordDigestCollumnToShopkeeper < ActiveRecord::Migration[5.2]
  def change
    add_column :shopkeepers, :password_digest, :string
  end
end
