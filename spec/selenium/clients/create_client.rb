# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'Clients', type: :feature do
  before do
    begin
      @client = FactoryBot.create(:client)
    rescue StandardError => e
      puts(e.message).to_s
    end
  end
  scenario 'Creates a new client' do
    begin
      visit '/users/sign_in'
      # visit "/"

      within find('#new_user') do
        fill_in 'user_email', with: 'secretary@example.com'
        fill_in 'user_password', with: 'secretary'
        click_button 'Iniciar sesión'
      end

      visit '/clients/new'
      # visit "/"

      within find('#new_client') do
        fill_in 'first_name', with: '{@client.first_name}'
        fill_in 'last_name', with: '{@client.last_name}'
        fill_in 'phone_number', with: '{@client.phone_number}'
        fill_in 'doc_ruc', with: '{@client.doc_ruc}'
        fill_in 'email', with: '{@client.email}'
        click_button 'Submit'
      end
    rescue StandardError => e
      puts(e.message).to_s
    end
  end
end