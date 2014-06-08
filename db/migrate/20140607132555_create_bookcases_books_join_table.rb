class CreateBookcasesBooksJoinTable < ActiveRecord::Migration
  def change
    create_table :bookcases_books, id: false do |t|
      t.integer :bookcase_id
      t.integer :book_id
    end
  end
end
