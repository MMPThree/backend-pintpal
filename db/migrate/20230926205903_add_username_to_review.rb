class AddUsernameToReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :username, :string
  end
end
