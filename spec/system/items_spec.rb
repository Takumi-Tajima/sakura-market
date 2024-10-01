require 'rails_helper'

RSpec.describe '商品管理機能', type: :system do
  context 'ログインしてない時' do
    let!(:item) { create(:item, name: '大根', price: '200', description: '美味しい大根だよ', display: true) }
    let!(:private_item) { create(:item, name: 'おもち', display: false) }

    it '商品の一覧ページを閲覧できること' do
      visit root_path
      expect(page).to have_content '大根'
      expect(page).to have_content '¥220(税込)'
    end

    it '商品の詳細ページを閲覧できること' do
      visit root_path
      click_on '大根'
      expect(page).to have_content '大根'
      expect(page).to have_content '¥220(税込)'
      expect(page).to have_content '美味しい大根だよ'
    end

    it '非公開の商品が閲覧できないこと' do
      visit root_path
      expect(page).not_to have_content 'おもち'
      visit item_path(private_item)
      expect(page).to have_content 'ActiveRecord::RecordNotFound'
    end
  end
end
