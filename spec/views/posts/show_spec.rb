require 'rails_helper'

describe 'posts/show.html.slim' do
  let(:user) { create :user }
  let(:post) { create :post, user: user }
  before do
    assign(:post, post)
    render
  end

  it('displays title'){
    expect(rendered).to have_selector('h1', text:post.title)
  }
  it('displays body'){
    expect(rendered).to have_selector('p', text: post.body)
  }
  #it('displays username')do
  #  expect(rendered).to have_selector('p', text: post.username)
  #end
end
