class CreateProductLists < ActiveRecord::Migration[7.0]
  def change
    create_table :product_lists, id: :uuid do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid

      t.string :name, null: false
      t.boolean :favorited, default: false, null: false
      t.string :slug, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
