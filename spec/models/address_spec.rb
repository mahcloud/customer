require 'spec_helper'

describe Address do
  it { should belong_to :customer }
  it { should validate_presence_of :name }
  it { should validate_presence_of :phone }
  it { should validate_presence_of :address_1 }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :zip_code }
  it { should validate_presence_of :country }
end
