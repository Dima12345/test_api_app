require 'rails_helper'

RSpec.describe Contractor, type: :model do
  describe 'build contractor without name' do
    let(:contractor) { build(:contractor, name: nil) }

    it 'should be invalid' do
      expect(contractor.valid?).to eq(false)
    end
  end
end
