# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Song, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:books).through(:book_songs) }
    it { is_expected.to have_many(:book_songs) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:author) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:author_id) }
  end
end
