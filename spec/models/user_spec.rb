require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(first_name: "Jack", last_name: "Smith", mobile: "8889995678", email: "jsmith@sample.com", password: "fdsfs", password_confirmation: "fdsfs")}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a first_name" do
    subject.first_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a last_name" do
    subject.last_name=nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a last_name" do
    subject.mobile=nil
    expect(subject).to_not be_valid
  end
it "is not valid without a phone number"    
it "is not valid if the phone number is not 10 chars"   
it "is not valid if the phone number is not all digits"
end
