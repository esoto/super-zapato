require 'spec_helper'

describe Services::ArticlesController, "#index" do
  context "multiple articles in the data base" do
    let!(:article) { Article.create(AN_ARTICLE_PARAMS.merge(store_id: A_STORE_ID)) }
    let!(:another_article) { Article.create(ANOTHER_ARTICLE_PARAMS.merge(store_id: A_STORE_ID)) }

    it "responds with status 200" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it "returns the list of articles" do
      get :index
      articles = JSON::parse(response.body)["articles"]
      expect(articles.count).to eq 2
    end
  end
end

