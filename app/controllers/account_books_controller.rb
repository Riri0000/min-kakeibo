class AccountBooksController < ApplicationController
  before_action :set_account_book, only: %i[edit update destroy]

  def index
    @account_books = AccountBook.all.includes(%i[user expenses])
  end

  def new
    @account_book = AccountBook.new
    @expense = @account_book.expenses.build
  end

  def create
    @account_book = current_user.build_account_book(account_book_params)
    if @account_book.save
      redirect_to account_book_path(@account_book), success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :new
    end
  end

  # my家計簿の表示
  def show
    @account_book = AccountBook.find_by(user_id: current_user.id)
    @expenses = @account_book.expenses.order_by_expense_item_group
    @user_profile = UserProfile.find_by(user_id: current_user.id)
    @sum_of_expenditure = @account_book.expenses.sum(:expenditure)
    render :show
  end

  def edit; end

  def update
    @account_book.update(account_book_params)
    if @account_book.save
      redirect_to account_book_path(@account_book), success: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :new
    end
  end

  def destroy; end

  private

  def set_account_book
    @account_book = current_user.account_book
    @expenses = @account_book.expenses.includes(:expense_item)
  end

  def account_book_params
    params.require(:account_book).permit(:date,
                                         expenses_attributes: %i[
                                           id
                                           expenditure
                                           account_book_id
                                           expense_item_id
                                           _destroy
                                         ])
  end
end
