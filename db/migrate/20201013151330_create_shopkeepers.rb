class CreateShopkeepers < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'uuid-ossp'
    create_table :shopkeepers, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.string :name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
