class AddressesController < ApplicationController
  ADDRESS_LIST_PAGE = '/address_book/index/'
  ADDRESS_FORM_PAGE = '/address_book/newAddress/'

  def create
    @address = customer.addresses.new(address_params)
    if @address.save
      at = (params['address']['address_type'].to_i == 1)? 1 : 2
      AddressType.create({type: at, customer_id: customer.id, address_id: @address.id})
      redirect_to ADDRESS_LIST_PAGE
    else
      redirect_to ADDRESS_FORM_PAGE
    end
  end

  def update
    @address = customer.addresses.find(params['id'])
    if @address.update_attributes(address_params)
      at = (params['address']['address_type'].to_i == 1)? 1 : 2
      address_type = AddressType.find_by_customer_id_and_address_id(customer.id, @address.id)
      if address_type.nil?
        AddressType.create({type: at, customer_id: customer.id, address_id: @address.id})
      else
        address_type.update_attributes({type: at})
      end
      redirect_to ADDRESS_LIST_PAGE
    else
      redirect_to ADDRESS_FORM_PAGE
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to ADDRESS_LIST_PAGE
  end

  private

  def address_params
    params.require(:address).permit(:name, :nickname, :company, :attention, :phone, :ext, :address_1, :address_2, :address_3, :city, :state, :zip_code, :country)
  end
end
