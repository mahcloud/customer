require 'spec_helper'

describe AddressType do
  it { should belong_to :customer }
  it { should belong_to :address }
end
