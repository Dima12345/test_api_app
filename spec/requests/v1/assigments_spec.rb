require 'rails_helper'

RSpec.describe "Assigments", type: :request do
  describe "GET /v1/assignments" do
    it '' do
      get('/v1/assignments')
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /v1/assignments/:id" do
    let!(:project) { create(:project) }
    let!(:employee) { create(:employee, total: 10) }
    let!(:assignments) { create(:assignment, rnd_percentage: 10, total: 10, owner: employee, project_id: project.id) }

    it '' do
      get("/v1/assignments/#{assignments.id}")
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /v1/assignments" do
    let!(:project) { create(:project) }
    let!(:employee) { create(:employee, total: 10) }
    let!(:assignments) { create(:assignment, rnd_percentage: 10, total: 10, owner: employee, project_id: project.id) }

    it '' do
      post "/v1/assignments", :params => {
        :assignment => {
          month: 1,
          rnd_percentage: 50,
          project_id: project.id,
          owner_id: employee.id,
          owner_type: 'Employee',
        }
      }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "PUT /v1/assignments/:id" do
    let!(:project) { create(:project) }
    let!(:employee) { create(:employee, total: 10) }
    let!(:assignments) { create(:assignment, rnd_percentage: 10, total: 10, owner: employee, project_id: project.id) }

    it '' do
      put "/v1/assignments/#{assignments.id}", :params => {
        :assignment => {
          month: 12,
          rnd_percentage: 70,
        }
      }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['data']['attributes']['rnd_percentage']).to eq('70.0')
      expect(JSON.parse(response.body)['data']['attributes']['month']).to eq(12)
    end
  end
end
