class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.bigint :user_id
      t.bigint :property_id

      t.string  :tx_hash
      t.string  :tx_type
      t.integer :token_amount
      t.decimal :amount_usd, precision: 12, scale: 2
      t.jsonb   :meta

      t.timestamps
    end

    add_index :transactions, :user_id
    add_index :transactions, :property_id
  end
end
