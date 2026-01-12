require "eth"

module Blockchain
  class EthereumClient
    def initialize
      @client = Eth::Client.create(
        Rails.application.config.blockchain[:rpc_url]
      )

      @key = Eth::Key.new(
        priv: Rails.application.config.blockchain[:admin_private_key]
      )
    end

    def factory_contract
      @factory_contract ||= Eth::Contract.from_abi(
        name: "PropertyFactory",
        address: Rails.application.config.blockchain[:factory_address],
        abi: property_factory_abi
      ).tap { |c| c.key = @key }
    end

    def create_property_token(property)
      tx = factory_contract.transact.createPropertyToken(
        property.id,
        property.title,
        property.title.upcase.first(6),
        property.total_tokens
      )

      tx # returns tx hash
    end

    private

    def property_factory_abi
      JSON.parse(File.read(
        Rails.root.join("contracts/abi/PropertyFactory.json")
      ))
    end
  end
end
