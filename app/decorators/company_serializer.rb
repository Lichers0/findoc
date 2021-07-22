# frozen_string_literal: true

class CompanySerializer
  def initialize(object)
    @object = object
  end

  def as_json(_ = {})
    @object.as_json(only: [:id, :name])
  end
end
