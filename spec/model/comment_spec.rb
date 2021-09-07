# frozen_string_literal: true

RSpec.describe Spree::Comment, type: :model do
  it 'has a valid factory' do
    expect(build_stubbed(:comment)).to be_valid
  end

  it 'validates comment presence' do
    expect(build_stubbed(:comment)).to validate_presence_of(:comment)
  end
end
