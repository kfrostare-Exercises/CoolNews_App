require 'rails_helper'

feature 'User can create articles' do
  before do
    visit root_path
    click_on "New Article"
  end

  context 'Successfully create an article [Happy Path]' do
    before do
      fill_in 'Title', with: 'Have a great summer'
      fill_in 'Content', with: 'Buy your booze now!'
      click_on 'Create Article'
    end

    it 'User should be on the article show page' do
      article = Article.find_by(title: 'Have a great summer')
      expect(current_path).to eq article_path(article)
    end

    it 'User should see success message' do
      expect(page).to have_content 'Article was successfully created!'
    end

    it 'User should see article title' do
      expect(page).to have_content 'Have a great summer'
    end

    it 'User should see article content' do
      expect(page).to have_content 'Buy your booze now!'
    end
  end

  context "User doesn't enter a title for the article [Sad Path]" do
    before do
      fill_in 'Content', with: 'Buy your booze now!'
      click_on 'Create Article'
    end

    it 'User should see error message' do
      expect(page).to have_content "Woops! The title can't be blank."
    end
  end

  context "User doesn't enter any content for the article [Sad Path]" do
    before do
      fill_in 'Title', with: 'Have a great summer'
      click_on 'Create Article'
    end

    it 'User should see error message' do
      expect(page).to have_content "Woops! There is no story here."
    end
  end
end
