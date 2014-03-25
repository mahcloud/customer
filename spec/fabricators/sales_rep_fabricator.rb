Fabricator(:sales_rep) do
  name { sequence(:name) { |i| "Sales Rep #{i}" } }
  email { sequence(:email) { |i| SecureRandom.hex(12) + "#{i}@1000bulbs.com" } }
  password 'password'
  salt 'salt'
  phone '214'
  fax '214'
  status ''
  syspro_id ''
end
