# frozen_string_literal: true

class BrokerSerialize
  def initialize(object)
    @object = object
  end

  def as_json(_options = {})
    @object.as_json(only: [:id, :name])
  end
end
