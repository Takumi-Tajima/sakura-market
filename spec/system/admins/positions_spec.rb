require 'rails_helper'

RSpec.describe '商品の並び順', type: :system do
  let(:admin) { create(:admin) }
  let!(:item1) { create(:item, name: '大根', display: true) }
  let!(:item2) { create(:item, name: 'にんじん', display: true) }

  before do
    sign_in admin
  end

  it '商品の順番を並び替えることができること' do
    visit admins_root_path
    trows = all('tr').map(&:text)
    expect(trows[1]).to have_content '大根'
    expect(trows[2]).to have_content 'にんじん'
    item_row = page.find('table tr', text: '大根')
    within(item_row) do
      click_on '↓'
    end
    visit admins_root_path
    trows = all('tr').map(&:text)
    expect(trows[1]).to have_content 'にんじん'
    expect(trows[2]).to have_content '大根'
  end
end
