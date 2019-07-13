# frozen_string_literal: true

class EmployeeImportForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_reader :success_message

  attribute :file, default: nil

  def save
    @success_message = '2 employees has been created'
  end
end
