require 'spec_helper'

describe AddressesController do
  let(:customer) { Fabricate(:customer) }
  let(:sales_rep) { Fabricate(:sales_rep) }
  let(:user_session) { Fabricate(:user_session, :user_id => customer.id) }
  let(:params) { {
    :address_type => 1,
    :name => 'FooBar',
    :nickname => '',
    :company => '',
    :attention => '',
    :phone => '(214) 123-4567',
    :ext => '',
    :address_1 => 'Foo Bar Dr',
    :address_2 => '',
    :address_3 => '',
    :city => 'Garland',
    :state => 'TX',
    :zip_code => '75041',
    :country => 'USA'
  } }
  let(:invalid_params) { {
    :address_type => '',
    :name => '',
    :nickname => '',
    :company => '',
    :attention => '',
    :phone => '',
    :ext => '',
    :address_1 => '',
    :address_2 => '',
    :address_3 => '',
    :city => '',
    :state => '',
    :zip_code => '',
    :country => ''
  } }
  before(:each) do
    request.cookies['session_id'] = user_session.token
  end

  describe "#index" do
    let!(:address) { Fabricate(:address, :customer_id => customer.id) }

    it "should list all addresses" do
      get :index
      assigns(:addresses).length.should == 1
      assigns(:addresses)[0].name.should == address.name
    end
  end

  describe "#new" do
    it "should set address" do
      get :new
      assigns(:address).id.should == nil
    end
  end

  describe "#edit" do
    let(:address) { Fabricate(:address, :customer_id => customer.id) }

    it "should set address" do
      get :edit, :id => address.id
      assigns(:address).id.should == address.id
    end
  end

  describe "#create" do
    context "customer" do
      it "should create the address" do
        expect { post :create, :address => params}.to change{Address.all.count}.by 1
      end

      it "should redirect" do
        post :create, :address => params
        response.should redirect_to addresses_path
      end
    end

    context "invalid address" do
      it "should not create the address" do
        expect { post :create, :address => invalid_params}.to change{Address.all.count}.by 0
      end

      it "should redirect" do
        post :create, :address => invalid_params
        response.should render_template("addresses/new")
      end
    end

    context "sales rep logged in as customer" do
      let(:user_session) { Fabricate(:user_session, :user_id => sales_rep.id, :user_type => 'sales_rep') }

      it "should create the address" do
        expect { post :create, :customer_id => customer.id, :address => params }.to change{Address.all.count}.by 1
      end

      it "should redirect" do
        post :create, :customer_id => customer.id, :address => params
        response.should redirect_to addresses_path
      end
    end
  end

  describe "#update" do
    let(:address) { Fabricate(:address, :customer_id => customer.id) }
    let(:unauthorized_address) { Fabricate(:address) }

    context "customer" do
      it "should update the address" do
        post :update, :id => address.id, :address => params
        address.reload
        address.name.should == params[:name]
      end

      it "should redirect" do
        post :update, :id => address.id, :address => params
        response.should redirect_to addresses_path
      end
    end

    context "invalid address" do
      it "should not update the address" do
        post :update, :id => address.id, :address => invalid_params
        address.reload
        address.name.should_not == params[:name]
      end

      it "should redirect" do
        post :update, :id => address.id, :address => invalid_params
        response.should render_template("addresses/edit")
      end
    end

    context "unauthorized address" do
      it "should not update the address" do
        post :update, :id => unauthorized_address.id, :address => params
        address.reload
        address.name.should_not == params[:name]
      end

      it "should redirect" do
        post :update, :id => unauthorized_address.id, :address => params
        response.should redirect_to addresses_path
      end
    end

    context "sales rep logged in as customer" do
      let(:user_session) { Fabricate(:user_session, :user_id => sales_rep.id, :user_type => 'sales_rep') }

      it "should update the address" do
        post :update, :id => address.id, :customer_id => customer.id, :address => params
        address.reload
        address.name.should == params[:name]
      end

      it "should redirect" do
        post :update, :id => address.id, :customer_id => customer.id, :address => params
        response.should redirect_to addresses_path
      end
    end
  end
end
