Rails.application.config.blockchain = {
  rpc_url: "http://127.0.0.1:8545",
  chain_id: 31337,
  factory_address: ENV.fetch("PROPERTY_FACTORY_ADDRESS", nil),
  admin_private_key: ENV.fetch("ADMIN_PRIVATE_KEY", nil)
}
