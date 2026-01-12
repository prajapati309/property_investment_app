class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :title, null: false
      t.string :location, null: false
      t.text   :description
      t.string :token_address
      t.string :image_url

      t.integer :total_tokens, default: 1000
      t.integer :available_tokens, default: 1000
      t.decimal :price_per_token, precision: 10, scale: 2, default: 50.00

      t.decimal :annual_rent_yield, precision: 5, scale: 2, default: 7.5

      t.timestamps
    end
  end
end
