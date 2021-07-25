# frozen_string_literal: true

# == Schema Information
#
# Table name: counterparties
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Counterparty < ApplicationRecord
  has_many :goods_receipts, dependent: :destroy
  has_many :as_broker_goods_receipts, dependent: :destroy
end
