class AddressesController < ApplicationController
  def index
    @addresses = customer.addresses
  end

  def new
    @address = customer.addresses.new
  end

  def edit
    @address = customer.addresses.find(params[:id])
  end

  def create
    @address = customer.addresses.new(address_params)
    @address_type = (params['address']['address_type'].to_i == 1)? 1 : 2
    if @address.save
      AddressType.create({type: @address_type, customer_id: customer.id, address_id: @address.id})
      redirect_to addresses_path
    else
      render 'new'
    end
  end

  def update
    @address = customer.addresses.find(params['id'])
    @address_type = (params['address']['address_type'].to_i == 1)? 1 : 2
    if @address.update_attributes(address_params)
      address_type = AddressType.find_by_customer_id_and_address_id(customer.id, @address.id)
      if address_type.nil?
        AddressType.create({type: @address_type, customer_id: customer.id, address_id: @address.id})
      else
        address_type.update_attributes({type: @address_type})
      end
      redirect_to addresses_path
    else
      render 'edit'
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :nickname, :company, :attention, :phone, :ext, :address_1, :address_2, :address_3, :city, :state, :zip_code, :country)
  end
end
