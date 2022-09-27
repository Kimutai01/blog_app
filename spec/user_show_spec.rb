require 'rails_helper'

RSpec.describe "UsersShow", type: :feature do
    before :each do
        @user = User.create(name: "Robertson Arthur", photo:"https://images.unsplash.com/photo-1664126409242-5390777fc5f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60", bio: "Rails developer")
        @user2 = User.create(name: "Kiprotich Kimutai", photo:"https://images.unsplash.com/photo-1664126409242-5390777fc5f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60", bio: "React developer")
        @user3 = User.create(name: "John doe", photo:"https://images.unsplash.com/photo-1664126409242-5390777fc5f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60", bio: "Full stack developer")
    
        5.times do |i|
          Post.create(author: @user, title: "Post #{i}", text: "This is the first post")
        end
        visit user_path(@user.id)    
      end
   
    it 'displays profile photo for each user' do       
        expect(page).to have_css("img[src*='https://images.unsplash.com/photo-1664126409242-5390777fc5f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60']")
    end

    it 'displays users unsername' do       
        expect(page).to have_content(@user.name)
    end  
end
        