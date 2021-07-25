# == Schema Information
#
# Table name: documents_goods_receipt_products
#
#  id               :bigint           not null, primary key
#  amount           :decimal(12, 4)
#  broker_amount    :decimal(12, 4)
#  broker_price     :decimal(12, 4)
#  price            :decimal(12, 4)
#  quantity         :integer
#  total            :decimal(12, 4)
#  upc              :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  goods_receipt_id :bigint           not null
#
# Indexes
#
#  index_documents_goods_receipt_products_on_goods_receipt_id  (goods_receipt_id)
#
# Foreign Keys
#
#  fk_rails_...  (goods_receipt_id => goods_receipts.id)
#
class Documents::GoodsReceiptProduct < ApplicationRecord
  belongs_to :goods_receipt
end
