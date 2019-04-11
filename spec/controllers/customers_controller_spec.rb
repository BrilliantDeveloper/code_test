require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  it 'renders the :new customer template' do
    get :new
    expect(response).to render_template :new
  end
end
