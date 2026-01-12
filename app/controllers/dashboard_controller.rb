class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = current_user.transactions.includes(:property)
    @invested_properties = Property.joins(:transactions)
                                    .where(transactions: { user_id: current_user.id })
                                    .distinct
  end
end
