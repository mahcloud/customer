class Address < ActiveRecord::Base
  self.table_name = 'customer_addresses'
  self.primary_key = 'address_id'

  belongs_to :customer, :class_name => "Customer"

  validates :name, presence: true
  validates :phone, presence: true
  validates :address_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :country, presence: true
end
