require 'rails_helper'

describe "Add new business info" do
  before :all do
    visit "/"
  end

  before(:each){visit new_my_mailer_path} 
  
  it "Render new scheduler page" do
    expect(page).to have_content("New My Mailer")
    email = Faker::Internet.email
    fill_in("my_mailer_email",:with=> email)
    fill_in("my_mailer_subject",:with=> Faker::Lorem.word)
    fill_in("my_mailer_body",:with=> Faker::Lorem.word)
    click_button("Create My mailer")
    expect(page).to have_content("Scheduled Mailers")
    #sleep 3
    #visit my_mailers_path
    #expect(page).to_not have_content(email)

  end
end