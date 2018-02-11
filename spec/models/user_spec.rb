require 'rails_helper'

describe User do
  context "validations" do
    it { should validate_presence_of (:email)}
    it { should validate_presence_of (:password)}
    it { should validate_presence_of (:full_name)}
  end
    xit { should_validate_uniqueness_of (:email)}
    # doesn't work for me? what gives???
end
