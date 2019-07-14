# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Import Users Spec', type: :system do
  before do
    driven_by :rack_test
  end

  context 'with valid params' do
    it 'returns succeess message' do
      visit new_employees_import_path
      file = Rails.root.join('spec', 'fixtures', 'files', 'users-all-valid.xlsx')
      attach_file :employee_import_form_file, file
      click_on 'Submit'
      expect(page).to have_content '3 employees has been created'
    end
  end
end
