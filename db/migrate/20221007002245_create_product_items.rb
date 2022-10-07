class CreateProductItems < ActiveRecord::Migration[7.0]
  def change
    create_table :product_items, id: :uuid do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.belongs_to :product_list, null: false, foreign_key: true, type: :uuid

      t.string :name, null: false
      t.string :slug, null: false, index: { unique: true }
      t.string :status, default: :active, null: false
      t.string :category, default: 'other', null: false
      t.integer :position, null: false

      t.timestamps
    end
  end
end
