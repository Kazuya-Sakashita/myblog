class AddDelFlagToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :del_flag, :integer
  end
end
