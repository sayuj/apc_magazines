require 'rails_helper'

RSpec.describe "magazines/edit", type: :view do
  before(:each) do
    @magazine = assign(:magazine, Magazine.create!())
  end

  it "renders the edit magazine form" do
    render

    assert_select "form[action=?][method=?]", magazine_path(@magazine), "post" do
    end
  end
end
