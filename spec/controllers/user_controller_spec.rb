require 'rails_helper'

RSpec.describe UserController, type: :controller do

  it "Puedo crear un usuario" do
    
    post "/users/register", :widget => {:name => "My Widget"}

    expect(response).to redirect_to(assigns(:widget))
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to include("Widget was successfully created.")
  end


end
