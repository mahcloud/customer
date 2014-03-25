Fabricator(:customer) do
  account_type 'Personal'
  name { sequence(:name) { |i| "Customer #{i}" } }
  email { sequence(:email) { |i| SecureRandom.hex(12) + "#{i}@1000bulbs.com" } }
  password 'password'
  date_registered '2013-08-01 00:00:00'
  last_login '2013-08-01 00:00:00'
  sales_rep 0
  salt 'salt'
  shipping_discount 0
  tax_exempt 0
  credit_limit 0
  password_change_required 0
  on_hold 0
  credit_balance 0
end
