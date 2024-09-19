require 'rails_helper'

RSpec.describe '商品管理機能', type: :system do
  context 'ログインしてない時' do
    it '商品一覧にアクセスするとログイン画面に遷移する' do
      visit admins_root_path
      expect(page).to have_content 'ログインをしてください'
      expect(page).to have_current_path new_admin_session_path
    end
  end

  context 'ログインしてる時' do
    let(:admin) { create(:admin) }
    let!(:item) { create(:item, name: '大根', price: '200', description: '美味しい大根だよ') }

    before do
      sign_in admin
    end

    it '商品の一覧が閲覧できる' do
      visit admins_root_path
      expect(page).to have_content '大根'
      expect(page).to have_content '¥220(税込)'
    end

    it '商品を登録できる' do
      visit new_admins_item_path
      fill_in '商品名', with: 'にんじん'
      fill_in '価格', with: '500'
      fill_in '説明', with: '美味しいにんじんを作ったので食べてください'
      expect do
        click_on '登録'
        expect(page).to have_content '商品の登録が完了しました'
      end.to change(Item, :count).by(1)
      expect(page).to have_content 'にんじん'
      expect(page).to have_content '¥550(税込)'
      expect(page).to have_content '美味しいにんじんを作ったので食べてください'
    end

    it '商品を編集できる' do
      visit root_path
      expect(page).to have_content '大根'
      visit edit_admins_item_path(item)
      fill_in '商品名', with: 'きのこ'
      fill_in '価格', with: '350'
      fill_in '説明', with: 'このきのこはすごく美味しいです'
      click_on '登録'
      expect(page).not_to have_content '大根'
      expect(page).to have_content 'きのこ'
    end

    it '商品を削除できる' do
      visit edit_admins_item_path(item)
      expect do
        accept_confirm do
          click_on '削除'
        end
        expect(page).to have_content '商品の削除が完了しました'
      end.to change(Item, :count).by(-1)
      expect(page).not_to have_content '大根'
    end
  end
end
