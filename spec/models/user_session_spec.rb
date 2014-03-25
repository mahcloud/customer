require 'spec_helper'

describe UserSession do
  describe "user" do
    context "customer" do
      let(:customer) { Fabricate(:customer) }
      let(:user_session) { Fabricate(:user_session, :user_type => 'customer', :user_id => customer.id) }

      it "should belong to a customer" do
        user_session.customer.should == customer
        user_session.user.should == customer
      end
    end

    context "sales rep" do
      let(:sales_rep) { Fabricate(:sales_rep) }
      let(:user_session) { Fabricate(:user_session, :user_type => 'sales_rep', :user_id => sales_rep.id) }

      it "should belong to a sales rep" do
        user_session.sales_rep.should == sales_rep
        user_session.user.should == sales_rep
      end
    end
  end
end
