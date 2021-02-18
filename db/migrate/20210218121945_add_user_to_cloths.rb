class AddUserToCloths < ActiveRecord::Migration[5.2]
  def change
    add_reference :cloths, :user, foreign_key: true
  end
end
