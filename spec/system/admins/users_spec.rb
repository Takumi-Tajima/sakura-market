require 'rails_helper'

RSpec.describe '管理者のユーザー管理', type: :system do
  let(:admin) { create(:admin) }
  let!(:user1) { create(:user, email: 'test@example.com', password: 'password') }
  let!(:user2) { create(:user, email: 'fuga@example.com', password: 'password') }

  before do
    sign_in admin
  end

  it 'ユーザーの一覧を参照できる' do
    visit admins_users_path
    expect(page).to have_content 'test@example.com'
    expect(page).to have_content 'fuga@example.com'
  end
end
