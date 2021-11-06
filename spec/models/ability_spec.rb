require 'rails_helper'


describe Ability, 'can?' do

  context 'when initialized woth a user' do
    subject (:ability) {described_class.new(user)}

    let(:user) { create :user }
    
    it 'merges PostAbility' do
    
    end
  end

end
