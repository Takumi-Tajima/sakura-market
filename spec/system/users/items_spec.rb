require 'rails_helper'

RSpec.describe '商品管理機能', type: :system do
  context 'ログインしている時' do
    let(:user) { create(:user) }
    let!(:item) { create(:item, name: '大根', price: '200') }

    before do
      sign_in user
    end

    xit '商品の一覧ページを閲覧できること' do
      visit root_path
      expect(page).to have_content '大根'
      expect(page).to have_content '200'
    end
  end
end
