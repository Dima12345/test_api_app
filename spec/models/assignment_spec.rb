require 'rails_helper'

RSpec.describe Assignment, type: :model do
  let!(:project) { create(:project ) }
  let!(:employee) { create(:employee) }
  let!(:assignment) { create(:assignment, rnd_percentage: 10.0, total: 10, month: 12, project_id: project.id, owner_id: employee.id, owner_type: 'Employee' ) }

  describe 'Assignment' do
    context 'update with valid params' do
      subject { assignment.update(rnd_percentage: assignment.rnd_percentage * 2) }

      it '' do
        subject
        expect(assignment.reload.total.to_i).to eq(20)
      end
    end

    context 'update with invalid rnd_percentage param' do
      subject { assignment.update(rnd_percentage: rnd_percentage) }


      context 'with rnd_percentage out of range' do
        let(:rnd_percentage) { 200 }

        it '' do
          result = subject
          expect(result).to eq(false)
        end
      end

      context 'with empty rnd_percentage' do
        let(:rnd_percentage) { nil }

        it '' do
          result = subject
          expect(result).to eq(false)
        end
      end
    end

    context 'update with invalid month param' do
      subject { assignment.update(month: month) }


      context 'with month out of range' do
        let(:month) { 200 }

        it '' do
          result = subject
          expect(result).to eq(false)
        end
      end

      context 'with empty rnd_percentage' do
        let(:month) { nil }

        it '' do
          result = subject
          expect(result).to eq(false)
        end
      end
    end
  end
end
