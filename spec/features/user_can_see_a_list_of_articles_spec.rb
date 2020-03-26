require "rails_helper"

feature 'List articles on index page' do
  context 'with articles in db' do
    before do
      create(:article, title: 'A breaking news item')
      create(:article, title: 'Learn Rails 5')
      
      visit root_path
    end
    
    it 'displays first article title' do
      expect(page).to have_content 'A breaking news item'
    end
    
    it 'displays second article title' do
      expect(page).to have_content 'Learn Rails 5'
    end
  end
end