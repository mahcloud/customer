class ApplicationController < ActionController::Base
  def session_id
    cookies['session_id']
  end

  def session
    UserSession.find_by_token(session_id)
  end

  def current_user
    session.user
  end

  def customer
    customer = nil
    customer = current_user if current_user.is_a? Customer
    customer = Customer.find(params['customer_id']) if current_user.is_a? SalesRep
    customer
  end
end
