require 'rails_helper'

RSpec.describe "magazines/show", type: :view do
  before(:each) do
    @magazine = assign(:magazine, Magazine.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
