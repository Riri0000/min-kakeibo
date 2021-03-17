class AccountBooksController < ApplicationController
  before_action :set_account_book, only: %i[edit update destroy]

  def index
    @q = AccountBook.ransack(params[:q])
    @account_books = @q.result.includes([:likes, { user: [:user_profile, { avator_attachment: :blob }] }])
                       #  .sum_per_id
                       .order(likes_count: :desc)
                       .page(params[:page])
  end

  # my家計簿の表示
  def show
    @account_book = current_user.account_book
    @expenses_for_graph = @account_book.expenses.order_by_expense_item_group
    @expenses = @account_book.expenses.includes(:expense_item).order(expenditure: :desc)
    @user_profile = UserProfile.find_by(user_id: current_user.id)
    @sum_of_expenditure = @account_book.expenses.sum(:expenditure)
    render :show
  end

  def new
    @account_book = AccountBook.new
    @expense = @account_book.expenses.build
  end

  def edit; end

  def create
    @account_book = current_user.build_account_book(account_book_params)
    if @account_book.save
      redirect_to account_book_path(@account_book), success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def update
    if @account_book.update(account_book_params)
      redirect_to account_book_path(@account_book), success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  def destroy; end

  def likes
    @q = current_user.like_account_books.ransack(params[:q])
    @account_books = @q.result
                       .includes([:likes, { user: %i[user_profile avator_attachment] }])
                       .order(created_at: :desc)
                       .page(params[:page])
  end

  private

  def set_account_book
    @account_book = current_user.account_book
    @expenses = @account_book.expenses.includes(:expense_item)
  end

  def account_book_params
    params.require(:account_book).permit(:date,
                                         :monthly_income,
                                         expenses_attributes: %i[
                                           id
                                           expenditure
                                           note
                                           account_book_id
                                           expense_item_id
                                           _destroy
                                         ])
  end
end
