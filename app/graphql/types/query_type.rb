module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :all_shopkeepers, [ShopkeeperType], null: false,
      description: "All Shopkeepers list"
    def all_shopkeepers
      Shopkeeper.all
    end
  end
end
