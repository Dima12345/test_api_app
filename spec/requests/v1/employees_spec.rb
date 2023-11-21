require 'rails_helper'

RSpec.describe "Employees", type: :request do
  describe "GET /v1/employees" do
    it '' do
      get('/v1/employees')
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /v1/employees/:id" do
    let!(:project) { create(:project) }
    let!(:employee) { create(:employee, total: 10) }

    it '' do
      get("/v1/employees/#{employee.id}")
      expect(response).to have_http_status(:ok)
    end
  end
end
