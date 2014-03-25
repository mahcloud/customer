Fabricator(:address) do
  customer_id { Fabricate(:customer).id }
  nickname 'FooBars'
  name 'FootBoots'
  company 'FootyTooty'
  attention 'Nicholas Cage'
  address_1 '123 Sesame St'
  address_2 ''
  address_3 ''
  city 'Garland'
  state 'TX'
  zip_code '75040'
  country 'USA'
  ext '123'
  phone '123'
end
