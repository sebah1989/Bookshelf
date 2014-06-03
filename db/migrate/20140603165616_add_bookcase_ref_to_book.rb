class AddBookcaseRefToBook < ActiveRecord::Migration
  def change
    add_reference :books, :bookcase, index: true
  end
end
