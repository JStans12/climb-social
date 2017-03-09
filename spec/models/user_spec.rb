require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should have_secure_password }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :auth_token }
    it { should validate_presence_of :auth_token }
  end
end
