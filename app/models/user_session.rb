class UserSession < ActiveRecord::Base
  self.table_name = 'user_sessions'
  self.primary_key = 'user_session_id'

  belongs_to :customer, :foreign_key => 'user_id', conditions: proc{["'customer' = ?", user_type]}
  belongs_to :sales_rep, :foreign_key => 'user_id', conditions: proc{["'sales_rep' = ?", user_type]}

  def user
    user = customer
    user = sales_rep if user.nil?
    user
  end
end
