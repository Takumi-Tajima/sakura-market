require 'rails_helper'

RSpec.describe '管理者のユーザー管理', type: :system do
  let(:admin) { create(:admin) }
  let!(:user1) { create(:user, email: 'test@example.com') }
  let!(:user2) { create(:user, email: 'fuga@example.com') }

  before do
    sign_in admin
  end

  it 'ユーザーの一覧を参照できる' do
    visit admins_users_path
    expect(page).to have_content 'test@example.com'
    expect(page).to have_content 'fuga@example.com'
  end

  it 'ユーザーの情報を更新できる' do
    visit edit_admins_user_path(user1)
    fill_in 'メール',	with: 'takumi@example.com'
    click_on '登録'
    expect(page).to have_content '更新に成功しました'
    expect(page).to have_content 'takumi@example.com'
    expect(page).to have_content 'test@example.com'
  end

  it 'ユーザーを削除できる' do
    visit admins_users_path
    item_row = page.find('table tr', text: 'test@example.com')
    within(item_row) do
      accept_confirm('本当に削除しますか？') do
        click_on '削除'
      end
    end
    expect(page).to have_content 'ユーザーを削除しました'
    expect(page).to have_content 'test@example.com'
  end
end
