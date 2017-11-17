require './app/models/user'

describe User do

  let(:user) { described_class.new }

  describe 'user' do
    it 'should exist' do
      expect(user).to be_an_instance_of(User)
    end

    it 'should create a new user' do
      expect{ User.create(user_name: 'antonio@uniplaces', password: 'password') }.to change { User.all.count }.by(1)
    end
  end
end
