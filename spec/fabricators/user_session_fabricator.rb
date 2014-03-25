Fabricator(:user_session) do
  user_id { Fabricate(:customer).id }
  user_type 'customer'
  token { sequence(:token) { |i| SecureRandom.hex(12) + "#{i}" } }
end
