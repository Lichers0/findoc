class CreateDocumentsGoodsReceiptProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :goods_receipt_products do |t|
      t.string :upc
      t.integer :quantity
      t.decimal :price, precision: 12, scale: 4
      t.decimal :amount, precision: 12, scale: 4
      t.decimal :broker_price, precision: 12, scale: 4
      t.decimal :broker_amount, precision: 12, scale: 4
      t.decimal :total, precision: 12, scale: 4
      t.references :header, null: false, foreign_key: { to_table: "goods_receipt_headers" }
      t.integer :line_number

      t.timestamps
    end
  end
end
