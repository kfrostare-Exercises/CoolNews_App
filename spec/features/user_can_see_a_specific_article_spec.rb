require 'rails_helper'

feature 'User can see specific article' do
  before do
    create(:article, title: 'A breaking news item', content: 'Some breaking action')
    create(:article, title: 'Learn Rails 5', content: 'Build awesome rails applications')

    visit root_path
    click_on 'A breaking news item'
  end

  context 'Article displays' do
    it 'title' do
      expect(page).to have_content 'A breaking news item'
    end

    it 'content' do
      expect(page).to have_content 'Some breaking action'
    end
  end
end
