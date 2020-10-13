module Types
  class MutationType < BaseObject
    field :create_shopkeeper, mutation: Mutations::CreateShopkeeper
    field :sign_in_shopkeeper, mutation: Mutations::SignInShopkeeper
  end
end
