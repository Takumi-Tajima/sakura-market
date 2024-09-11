require 'rails_helper'

RSpec.describe '商品管理機能', type: :system do
  context 'ログインしてない時' do
    it '商品一覧にアクセスするとログイン画面に遷移する' do
      visit root_path
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
      visit root_path
      expect(page).to have_content '大根'
      expect(page).to have_content '200'
    end

    it '商品の詳細が閲覧できる' do
      visit root_path
      # TODO: withinで範囲を絞る
      click_on '大根'
      expect(page).to have_current_path admins_item_path(item)
      expect(page).to have_content '大根'
      # TODO: 税込価格表示
      expect(page).to have_content '200'
      expect(page).to have_content '美味しい大根だよ'
      # TODO: 公開フラグの表示テストも行う→ユーザー側の画面生成時に行う
    end

    it '商品を登録できる' do
      visit new_admins_item_path
      expect(page).to have_content '商品を追加'
      fill_in '商品名', with: 'にんじん'
      fill_in '価格', with: '500'
      fill_in '説明', with: '美味しいにんじんを作ったので食べてください'
      expect do
        click_on '登録'
        expect(page).to have_content '商品の登録が完了しました'
      end.to change(Item, :count).by(1)
      expect(page).to have_content 'にんじん'
      expect(page).to have_content '500'
      click_on 'にんじん'
      expect(page).to have_content 'にんじん'
      expect(page).to have_content '500'
      expect(page).to have_content '美味しいにんじんを作ったので食べてください'
    end

    it '商品を編集できる' do
      visit admins_item_path(item)
      click_on '編集'
      fill_in '商品名', with: 'きのこ'
      fill_in '価格', with: '350'
      fill_in '説明', with: 'このきのこはすごく美味しいです'
      click_on '登録'
      expect(page).not_to have_content '大根'
      expect(page).not_to have_content '200'
      expect(page).to have_content 'きのこ'
      expect(page).to have_content '350'
      click_on 'きのこ'
      expect(page).to have_content '350'
      expect(page).to have_content 'このきのこはすごく美味しいです'
    end

    it '商品を削除できる' do
      visit admins_item_path(item)
      expect do
        click_on '削除'
        expect(page).to have_content '商品の削除が完了しました'
      end.to change(Item, :count).by(-1)
      expect(page).not_to have_content '大根'
      expect(page).not_to have_content '200'
    end
  end
end
