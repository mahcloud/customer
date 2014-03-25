class Customer < ActiveRecord::Base
  self.table_name = 'customers'
  self.primary_key = 'customer_id'

  has_many :addresses, :class_name => "Address"
end
