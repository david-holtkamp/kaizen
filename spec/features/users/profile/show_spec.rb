require 'rails_helper'

RSpec.describe 'As a User' do 
    describe 'When I visit my profile' do 
        before :each do 
            user = create(:user)

            allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        end

        it 'By first logging in on the welcome page' do 

            visit '/'

            expect(page).to have_content("Login")

            click_on "Login"

            expect(current_path).to eq('/login')

            fill_in :email, with: user.email
            fill_in :password, with: user.password

            click_on "Login"

            expect(current_path).to eq("/profile")
        end
    end
end