class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author, null: false, limit: 40
      t.text :content, null: false
      t.references :post


      t.timestamps null: false
    end
  end
end
