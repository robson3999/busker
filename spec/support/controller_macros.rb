# frozen_string_literal: true

module ControllerMacros
  def login_user
    user = FactoryBot.create(:user)
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in user
    end

    user
  end
end
