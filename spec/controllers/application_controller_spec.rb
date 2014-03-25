require 'spec_helper'

describe ApplicationController do
  controller do
    def session_id
      super
    end

    def session
      super
    end

    def current_user
      super
    end

    def customer
      super
    end
  end

  describe "#session_id" do
    it "should return the session cookie" do
      request.cookies['session_id'] = 'foobar'
      controller.session_id == 'foobar'
    end
  end

  describe "#session" do
    let(:user_session) { Fabricate(:user_session) }

    it "should return the user session" do
      request.cookies['session_id'] = user_session.token
      controller.session.should == user_session
    end
  end

  describe "#current_user" do
    let(:customer) { Fabricate(:customer) }
      let(:user_session) { Fabricate(:user_session, :user_id => customer.id) }

    it "should return the current user" do
      request.cookies['session_id'] = user_session.token
      controller.current_user.should == customer
    end
  end

  describe "#customer" do
    let(:customer) { Fabricate(:customer) }
    let(:sales_rep) { Fabricate(:sales_rep) }
    before(:each) do
      request.cookies['session_id'] = user_session.token
    end

    context "customer" do
      let(:user_session) { Fabricate(:user_session, :user_id => customer.id) }

      it "should set customer" do
        controller.customer.should == customer
      end
    end

    context "no customer" do
      let(:user_session) { Fabricate(:user_session, :user_id => 0) }

      it "should not set customer" do
        controller.customer.should be_nil
      end
    end

    context "sales rep" do
      let(:user_session) { Fabricate(:user_session, :user_id => sales_rep.id, :user_type => 'sales_rep') }

      it "should set sales rep's customer" do
        controller.params[:customer_id] = customer.id
        controller.customer.should == customer
      end
    end
  end
end
