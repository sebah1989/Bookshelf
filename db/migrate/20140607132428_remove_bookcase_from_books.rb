class RemoveBookcaseFromBooks < ActiveRecord::Migration
  def change
    remove_reference :books, :bookcase, index: true
  end
end
