# frozen_string_literal: true

class CreateDocumentsGoodsReceiptHeaders < ActiveRecord::Migration[6.1]
  def change
    create_table :goods_receipt_headers do |t|
      t.datetime :dated, null: false
      t.references :company, null: false, foreign_key: true
      t.references :counterparty, null: false, foreign_key: true
      t.references :broker, null: true, foreign_key: { to_table: "counterparties" }
      t.references :warehouse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
