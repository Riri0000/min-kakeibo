class LikesController < ApplicationController
  def create
    account_book = AccountBook.find(params[:account_book_id])
    current_user.like(account_book)
    redirect_to account_books_path
  end

  def destroy
    account_book = current_user.likes.find(params[:id]).account_book
    current_user.dislike(account_book)
    redirect_to account_books_path
  end
end
