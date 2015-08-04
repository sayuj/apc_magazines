require 'rails_helper'

RSpec.describe "magazines/new", type: :view do
  before(:each) do
    assign(:magazine, Magazine.new())
  end

  it "renders new magazine form" do
    render

    assert_select "form[action=?][method=?]", magazines_path, "post" do
    end
  end
end
