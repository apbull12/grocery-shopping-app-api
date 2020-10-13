module Mutations
  class SignInShopkeeper < BaseMutation
    null true

    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    field :token, String, null: true
    field :shopkeeper, Types::ShopkeeperType, null: true

    def resolve(credentials: nil)
      # basic validation
      return unless credentials

      shopkeeper = Shopkeeper.find_by email: credentials[:email]

      # ensures we have the correct user
      return unless shopkeeper
      return unless shopkeeper.authenticate(credentials[:password])

      # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("shopkeeper-id:#{ shopkeeper.id }")

      context[:session][:token] = token

      { shopkeeper: shopkeeper, token: token }
    end
  end
end
