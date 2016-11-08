require 'rails_helper'

RSpec.describe School, type: :model do
  let(:school) {
    FactoryGirl.create(:school)
  }

  it 'should be created' do
    expect(school).to be_valid
  end

  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:pitch)}
  it {should validate_presence_of(:subdomain)}
  it {should validate_presence_of(:creation_date)}
  it {should validate_uniqueness_of(:subdomain)}

  describe 'should validate email' do
    before {school.email = ''}
    it {should_not be_valid}
  end
end
