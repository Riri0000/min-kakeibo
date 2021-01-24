class DashboardsController < ApplicationController
  skip_before_action :require_login

  def show
    @account_book = AccountBook.find(params[:id])
    @expenses_for_graph = @account_book.expenses.order_by_expense_item_group
    @expenses = @account_book.expenses.includes(:expense_item).order(expenditure: :desc)
    @user_profile = @account_book.user.user_profile
    @sum_of_expenditure = @account_book.expenses.sum(:expenditure)
  end
end
