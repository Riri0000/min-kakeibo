crumb :root do
  link 'トップページ', root_path
end

crumb :new_user do
  link 'ユーザー作成', new_user_path
  parent :root
end

crumb :edit_user do |_user|
  link 'ユーザー情報編集', edit_user_path
  parent :root
end

crumb :account_books do
  link '家計簿一覧', account_books_path
  parent :root
end

crumb :likes_account_books do
  link 'お気に入り家計簿一覧', likes_account_books_path
  parent :root
end

crumb :dashboard do
  link '家計簿詳細', dashboard_path
  parent :account_books
end

crumb :new_account_book do
  link 'My家計簿作成', new_account_book_path
  parent :root
end

crumb :new_user_profile do
  link 'プロフィール作成', new_user_profile_path
  parent :root
end

crumb :account_book do
  link 'My家計簿', account_book_path
  parent :root
end

crumb :edit_account_book do |account_book|
  link 'My家計簿編集', edit_account_book_path
  parent :account_book, account_book
end

crumb :edit_user_profile do |user_profile|
  link 'プロフィール編集', edit_user_profile_path
  parent :account_book, user_profile
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
