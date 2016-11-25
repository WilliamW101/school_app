require 'rails_helper'

RSpec.describe School, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:group) }
  end

  describe 'instance methods' do
    describe '#info' do
      it 'returns the type info message with name and state' do
        #Setup Code
        school = School.create(name: 'Yes', state: 'UT', group: 'k-12')
        # assertion / expection code
        expect(school.info).to eq("K-12: Yes, UT.")
      end

      it 'returns the group info message with name and state' do
        #Setup Code
        school = School.create(name: 'Yes', state: 'UT', group: 'college')
        # assertion / expection code
        expect(school.info).to eq("College: Yes, UT.")
      end

      it 'returns the group info message with name and state' do
        #Setup Code
        school = School.create(name: 'Yes', state: 'UT', group: 'other')
        # assertion / expection code
        expect(school.info).to eq("Other: Yes, UT.")
      end
    end
  end

end
