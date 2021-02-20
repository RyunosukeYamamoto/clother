class AddUserToTemp < ActiveRecord::Migration[5.2]
  def change
    add_reference :temps, :user, foreign_key: true
  end
end
