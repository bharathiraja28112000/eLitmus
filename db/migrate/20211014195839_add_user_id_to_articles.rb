class AddUserIdToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :userid, :integer
  end
end
