require 'rails_helper'

RSpec.describe Comic, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :issue }
    it { should validate_presence_of :publisher }

  end
end