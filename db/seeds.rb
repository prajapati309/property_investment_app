# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "🌱 Seeding demo data..."

# Clear old data
Transaction.delete_all
Property.delete_all
User.delete_all

puts "Creating demo users..."

admin = User.create!(
  name: "Admin User",
  email: "admin@defi.com",
  password: "password123",
  kyc_status: "approved",
  wallet_address: "0xADMIN123456789"
)

user1 = User.create!(
  name: "John Investor",
  email: "john@defi.com",
  password: "password123",
  kyc_status: "approved",
  wallet_address: "0xUSER123456789"
)

user2 = User.create!(
  name: "Alice Investor",
  email: "alice@defi.com",
  password: "password123",
  kyc_status: "approved",
  wallet_address: "0xUSER987654321"
)

puts "Creating demo properties..."

property1 = Property.create!(
  title: "Luxury Apartment – Mumbai",
  location: "Mumbai, India",
  description: "High-end sea-facing luxury apartments in South Mumbai.",
  image_url: "https://example.com/mumbai.jpg",
  token_address: "0xPROP111111111",
  total_tokens: 10000,
  available_tokens: 8500,
  price_per_token: 50.00,
  annual_rent_yield: 8.5
)

property2 = Property.create!(
  title: "Commercial Plaza – Dubai",
  location: "Dubai, UAE",
  description: "Premium commercial office spaces in Downtown Dubai.",
  image_url: "https://example.com/dubai.jpg",
  token_address: "0xPROP222222222",
  total_tokens: 8000,
  available_tokens: 6000,
  price_per_token: 75.00,
  annual_rent_yield: 7.2
)

property3 = Property.create!(
  title: "Beach Villas – Bali",
  location: "Bali, Indonesia",
  description: "Luxury beachfront villas for holiday rentals.",
  image_url: "https://example.com/bali.jpg",
  token_address: "0xPROP333333333",
  total_tokens: 5000,
  available_tokens: 4200,
  price_per_token: 65.00,
  annual_rent_yield: 9.0
)

puts "Creating demo transactions..."

Transaction.create!(
  user: user1,
  property: property1,
  tx_hash: "0xTX111111",
  tx_type: "buy_token",
  token_amount: 100,
  amount_usd: 5000.00
)

Transaction.create!(
  user: user2,
  property: property2,
  tx_hash: "0xTX222222",
  tx_type: "buy_token",
  token_amount: 50,
  amount_usd: 3750.00
)

Transaction.create!(
  user: user1,
  property: property3,
  tx_hash: "0xTX333333",
  tx_type: "rent_payout",
  token_amount: 0,
  amount_usd: 250.00
)

puts "✅ Seeding complete!"
puts "Demo login credentials:"
puts "Admin → admin@defi.com / password123"
puts "User → john@defi.com / password123"
puts "User → alice@defi.com / password123"
