require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "GET #index" do
    before { get :index }

    it "returns a successful response" do
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let(:book) { create(:book) }
    before { get :show, params: { id: book.id } }

    it "returns a successful response" do
      expect(response).to be_successful
    end
  end
end
