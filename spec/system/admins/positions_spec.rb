require 'rails_helper'

RSpec.describe '商品の並び順', type: :system do
  let(:admin) { create(:admin) }
  let!(:item1) { create(:item, name: '大根') }
  let!(:item2) { create(:item, name: 'にんじん') }

  before do
    sign_in admin
  end

  it '商品の順番を並び替えることができること' do
    visit root_path
    cards = all('.card').map(&:text)
    expect(cards[0]).to have_content '大根'
    expect(cards[1]).to have_content 'にんじん'
    visit admins_item_path(item1)
    within '.item-footer' do
      expect(page).to have_content '1'
      click_on '下へ'
      expect(page).to have_content '2'
    end
    visit root_path
    cards = all('.card').map(&:text)
    expect(cards[0]).to have_content 'にんじん'
    expect(cards[1]).to have_content '大根'
  end
end
