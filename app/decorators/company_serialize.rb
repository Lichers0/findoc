# frozen_string_literal: true

class CompanySerialize
  def initialize(object)
    @object = object
  end

  def as_json(_options)
    @object.as_json(only: [:id, :name])
  end
end
