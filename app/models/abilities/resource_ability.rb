module Abilities
  class ResourceAbility < Ability
    
    def initialize(user)
      @user = user
      user_abilities
    end
    
    private
    attr_reader :user
    def default_abilities; end
  end
end
