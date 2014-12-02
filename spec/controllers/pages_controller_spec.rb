require 'rails_helper'

describe PagesController do

  describe "#index" do

    it "render index if the session user_id is 3" do
      session[:user_id] = 3

      get :index

      expect(response).to render_template("index")
    end

    it "redirects to signin page if the session user_id is nil" do
      get :index

      expect(response).to redirect_to(signin_path)
    end

    it "renders 404 error if the session user_id is not 3" do
      session[:user_id] = 1

      get :index

      expect(response.status).to eq(404)
    end

  end

end
