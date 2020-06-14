class AddBirthdayAttributesToFriends < ActiveRecord::Migration[6.0]
  def change
    add_column :friends, :birthday_month, :string
    add_column :friends, :birthday_day, :integer
  end
end
