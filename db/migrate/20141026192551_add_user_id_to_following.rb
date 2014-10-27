class AddUserIdToFollowing < ActiveRecord::Migration
  def change
    add_column :followings, :user_id, :integer
  end
end
