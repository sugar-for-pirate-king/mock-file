# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmployeeImportForm do
  context 'with valid params' do
    it 'returns success message' do
      file_path = Rails.root.join(
        'spec', 'fixtures', 'files', 'users-all-valid.xlsx'
      )
      mock_excel = MockExcelFile.new(file_path)
      form = EmployeeImportForm.new(file: mock_excel)
      form.save
      expect(form.success_message).to eq '3 employees has been created'
      expect(User.all.pluck(:username, :age)).to include(
        ['pquest', 23], ['larapel', 44], ['kimono', 31]
      )
    end
  end

  private

  class MockExcelFile
    def initialize(path)
      @path = path
    end

    def path
      @path.to_s
    end
  end
end
