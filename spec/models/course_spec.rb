require 'rails_helper'

RSpec.describe Course, type: :model do

  let :course do
    FactoryGirl.create :course
  end

  it 'should be created' do
    expect(course).to be_valid
  end

  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:description)}
  it {should validate_presence_of(:content)}
  it {should validate_presence_of(:duration)}
  it {should validate_presence_of(:creation_date)}
  it {should validate_presence_of(:active_students)}
  it {should validate_presence_of(:price)}
  it {should belong_to(:school)}
end
