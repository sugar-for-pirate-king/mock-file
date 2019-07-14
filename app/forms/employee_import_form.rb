# frozen_string_literal: true

class EmployeeImportForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_reader :success_message

  attribute :file, default: nil

  def save
    total_created = 0
    xlsx = Roo::Spreadsheet.open(file)
    xlsx.parse(headers: true).each_with_index do |row, index|
      next if index.eql?(0)

      User.create(username: row['username'], age: row['age'])
      total_created += 1
    end
    @success_message = "#{total_created} employees has been created"
  end
end
