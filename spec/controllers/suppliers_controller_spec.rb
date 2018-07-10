require "rails_helper"

RSpec.describe SuppliersController do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
