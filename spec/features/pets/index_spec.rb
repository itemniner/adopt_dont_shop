require "rails_helper"

RSpec.describe "on the index page", type: :feature do 
  describe "as a visitor" do
    before(:each) do
      @shelter_1 = Shelter.create(  name: "Denver Shelter", 
                                    address: "123 fake st.",
                                    city: "Denver",
                                    state: "CO",
                                    zip: 80018)
      @pet_1 = Pet.create(          image: "https://images.theconversation.com/files/291243/original/file-20190906-175705-cjptgw.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1000&fit=clip",
                                    name: "Lucii",
                                    approximate_age: 6000,
                                    sex: "F",
                                    shelter: @shelter_1)
    end
    it "can see all pets and its information" do
      visit "/pets"

      within("#pet-#{@pet_1.id}") do
        expect(page).to have_content
        expect(page).to have_content("Name: #{@pet_1.name}")
        expect(page).to have_content("Age: #{@pet_1.approximate_age}")
        expect(page).to have_content("Sex: #{@pet_1.sex}")
        expect(page).to have_content("Current Shelter: #{@pet_1.shelter}")
      end
    end
  end
end