require 'rails_helper'

RSpec.describe Pet, type: :model do 
  describe "validations" do
    it { should validate_presence_of :image }
    it { should validate_presence_of :name }
    it { should validate_presence_of :approximate_age }
    it { should validate_presence_of :sex }
  end
  describe "relationship" do
    it { should belong_to :shelter }
  end
end
