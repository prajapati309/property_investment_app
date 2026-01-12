class AddKycFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :kyc_status, :string, default: "pending"
    add_column :users, :wallet_address, :string
  end
end
