require 'rails_helper'

RSpec.describe 'posts/index', type: :view do

  let(:user) { create (:user) }
  let(:posts) { create_list :post,3,user: user }
  before do
    assign( :posts, posts )
  end
  

end
