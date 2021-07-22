class CreateDocumentsGoodsReceiptProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :goods_receipt_products do |t|
      t.string :upc, null: false
      t.integer :quantity, null: false
      t.decimal :price, precision: 12, scale: 4, null: false
      t.decimal :amount, precision: 12, scale: 4, null: false
      t.decimal :broker_price, precision: 12, scale: 4
      t.decimal :broker_amount, precision: 12, scale: 4
      t.decimal :total, precision: 12, scale: 4, null: false
      t.references :header, null: false, foreign_key: { to_table: "goods_receipt_headers" }
      t.integer :line_numbe, null: false

      t.timestamps
    end
  end
end
