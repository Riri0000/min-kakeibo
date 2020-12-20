class DashboardsController < ApplicationController
  def show
    @account_book = AccountBook.find(params[:id])
    @expenses = @account_book.expenses.order_by_expense_item_group
    @user_profile = @account_book.user.user_profile
    @sum_of_expenditure = @account_book.expenses.sum(:expenditure)
  end
end
