# frozen_string_literal: true

# == Schema Information
#
# Table name: goods_receipts
#
#  id              :bigint           not null, primary key
#  dated           :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  broker_id       :bigint           not null
#  company_id      :bigint           not null
#  counterparty_id :bigint           not null
#  warehouse_id    :bigint           not null
#
# Indexes
#
#  index_goods_receipts_on_broker_id        (broker_id)
#  index_goods_receipts_on_company_id       (company_id)
#  index_goods_receipts_on_counterparty_id  (counterparty_id)
#  index_goods_receipts_on_warehouse_id     (warehouse_id)
#
# Foreign Keys
#
#  fk_rails_...  (broker_id => counterparties.id)
#  fk_rails_...  (company_id => companies)
#  fk_rails_...  (counterparty_id => counterparties.id)
#  fk_rails_...  (warehouse_id => warehouses.id)
#
module Documents
  class GoodsReceiptHeader < ApplicationRecord
    belongs_to :company
    belongs_to :counterparty
    belongs_to :broker, class_name: "Counterparty", optional: true
    belongs_to :warehouse

    has_many :products, dependent: :destroy, inverse_of: "header"
  end
end
