class AddUserRefToBookcase < ActiveRecord::Migration
  def change
    add_reference :bookcases, :user, index: true
  end
end
