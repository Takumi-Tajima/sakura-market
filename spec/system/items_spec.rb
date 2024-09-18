require 'rails_helper'

RSpec.describe '商品管理機能', type: :system do
  context 'ログインしてない時' do
    let!(:item) { create(:item, name: '大根', price: '¥200') }

    it '商品の一覧ページを閲覧できること' do
      visit root_path
      expect(page).to have_content '大根'
      expect(page).to have_content '¥200'
    end
  end
end
