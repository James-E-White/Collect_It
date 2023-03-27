require 'rails_helper'

RSpec.describe ActionFigure, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
  end

  describe 'validations' do
    it { should validate_presence_of :figure }
    it { should validate_presence_of :brand }
  end
end