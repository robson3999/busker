# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:songs) }
  end
end
