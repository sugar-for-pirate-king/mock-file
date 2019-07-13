# frozen_string_literal: true

module Employees
  class ImportsController < ApplicationController
    def new
      @form = EmployeeImportForm.new
    end

    def create
      form = EmployeeImportForm.new(form_params)
      form.save
      flash[:success] = form.success_message
      redirect_to new_employees_import_path
    end

    private

    def form_params
      params.require(:employee_import_form).permit(:file)
    end
  end
end
