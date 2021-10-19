require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  # Actual test
  scenario "They can click the details button and see product description" do
    # ACT
    visit root_path
    first('.product').click_link('Details') 
   
    # puts page.html

    # DEBUG / VERIFY
    save_screenshot

    expect(page).to have_content 'Description'
  end



end
