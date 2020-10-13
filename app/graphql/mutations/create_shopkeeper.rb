module Mutations
  class CreateShopkeeper < BaseMutation
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    argument :name, String, required: true
    argument :auth_provider, AuthProviderSignupData, required: false

    # return type from the mutation
    type Types::ShopkeeperType

    def resolve(name: nil, email: nil, auth_provider: nil)
      Shopkeeper.create!(
          name: name,
          email: auth_provider&.[](:credentials)&.[](:email),
          password: auth_provider&.[](:credentials)&.[](:password)
          )
    end
  end
end
