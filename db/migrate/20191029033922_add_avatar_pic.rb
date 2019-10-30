class AddAvatarPic < ActiveRecord::Migration[5.2]
  def change
   add_column :users, :avatar_pic, :string
  end
end
