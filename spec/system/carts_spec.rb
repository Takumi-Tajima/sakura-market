require 'rails_helper'

RSpec.describe 'カート機能', type: :system do
  let(:user) { create(:user) }
  let(:item) { create(:item, name: 'きゅうり', display: true) }

  before do
    sign_in user
  end

  it '商品をカートに追加、削除できること' do
    visit item_path(item)
    expect(page).to have_content 'きゅうり'
    fill_in '個数',	with: '3'
    expect do
      click_on 'カートに入れる'
      expect(page).to have_content 'カートに追加しました'
    end.to change(CartItem, :count).by(1)
    within '.navbar' do
      click_on 'カート'
    end
    expect(page).to have_css('div.col', text: 'きゅうり')
    expect(page).to have_css('div.col', text: '3')
    expect do
      click_on '削除'
      expect(page).to have_content 'カートから商品が削除されました。'
    end.to change(CartItem, :count).by(-1)
    expect(page).not_to have_content 'きゅうり'
  end

  context '同じ商品を追加した場合' do
    before do
      visit item_path(item)
      fill_in '個数',	with: '5'
      click_on 'カートに入れる'
    end

    it 'カート内の商品の個数が増えること' do
      visit cart_items_path
      expect(page).to have_content 'きゅうり'
      expect(page).to have_content '5'
      visit item_path(item)
      fill_in '個数',	with: '3'
      expect do
        click_on 'カートに入れる'
        expect(page).to have_content 'カートに追加しました'
      end.not_to change(CartItem, :count)
      visit cart_items_path
      expect(page).to have_content 'きゅうり'
      expect(page).to have_content '8'
    end
  end
end
