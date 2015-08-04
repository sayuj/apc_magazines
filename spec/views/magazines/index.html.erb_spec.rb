require 'rails_helper'

RSpec.describe "magazines/index", type: :view do
  before(:each) do
    assign(:magazines, [
      Magazine.create!(),
      Magazine.create!()
    ])
  end

  it "renders a list of magazines" do
    render
  end
end
