class AddressType < ActiveRecord::Base
  self.table_name = 'customer_address_types'
  self.primary_key = 'address_type_id'
  self.inheritance_column = :_type_disabled

  belongs_to :customer, :class_name => "Customer"
  belongs_to :address, :class_name => "Address"
end
