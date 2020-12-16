class AccountBooksController < ApplicationController
  before_action :set_account_book, only: %i[edit update destroy]

  def new
    @account_book = AccountBook.new
    @expense = @account_book.expenses.build
  end

  def create
    @account_book = current_user.build_account_book(account_book_params)
    if @account_book.save
      redirect_to account_book_path(@account_book), success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def show
    @account_book = AccountBook.find(params[:id])
    @expenses = @account_book.expenses.includes(:expense_item)
  end

  def mypage
    @account_book = AccountBook.find_by(user_id: current_user.id)
    @expenses = @account_book.expenses.includes(:expense_item)
    render :show
  end

  def edit; end

  def update
    @account_book.update(account_book_params)
    if @account_book.save
      redirect_to account_book_path(@account_book), success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def destroy

  end

  private

  def set_account_book
    @account_book = current_user.account_book
    @expenses = @account_book.expenses
  end

  def account_book_params
    params.require(:account_book).permit(:date,
                                  expenses_attributes: [
                                                      :id,
                                                      :expenditure,
                                                      :account_book_id,
                                                      :expense_item_id,
                                                      :_destroy])
  end
end