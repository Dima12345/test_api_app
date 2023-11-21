require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'update total assignments' do
    let!(:project) { create(:project ) }
    let!(:employee) { create(:employee, total: 10) }
    let!(:assignments) { create(:assignment, rnd_percentage: 10, total: 10, owner: employee, project_id: project.id) }

    subject { assignments.update(total: 100) }

    it 'should update employee\'s total' do
      subject
      expect(employee.reload.total.to_i).to eq(100)
    end
  end


  describe 'when emploee is envalid' do
    let(:employee) { build(:employee, name: nil) }

    it 'should be not valid' do
      expect(employee.valid?).to eq(false)
    end
  end
end
