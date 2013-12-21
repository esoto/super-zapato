require 'spec_helper'

describe Services::StoresController, "#index" do
  context "multiple stores in the data base" do
    before(:each) do
      Store.create(A_STORE_PARAMS)
      Store.create(ANOTHER_STORE_PARAMS)
    end

    it "responds with status 200" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it "returns the list of stores" do
      get :index
      stores = JSON::parse(response.body)["stores"]
      expect(stores.count).to eq 2
    end
  end
end

describe Services::StoresController, "#articles_by_store" do
  context "correct params sent" do
    let(:store) { Store.create(A_STORE_PARAMS) }
    let(:another_store) { Store.create(ANOTHER_STORE_PARAMS) }

    let(:params) { { id: store.id } }

    before(:each) do
      Article.create(AN_ARTICLE_PARAMS.merge(store_id: store.id))
      Article.create(ANOTHER_ARTICLE_PARAMS.merge(store_id: another_store.id))
    end

    it "responds with status 200" do
      get :articles_by_store, params

      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it "returns the list of article for a single store" do
      get :articles_by_store, params

      articles = JSON::parse(response.body)["articles"]
      expect(articles.count).to eq 1
    end
  end

  describe "incorrect params sent" do
    context "store id is not integer or is negative" do
      let(:params_text) { { id: "id" } }
      let(:params_negative) { { id: -1 } }

      it "returns 400 status" do
        get :articles_by_store, params_text

        response_body = JSON::parse(response.body)
        expect(response_body["error_code"]).to eq 400
      end

      it "answers with a message" do
        get :articles_by_store, params_negative

        response_body = JSON::parse(response.body)
        expect(response_body["error_msg"]).to eq "Bad Request"
      end

      it "answers with a success false" do
        get :articles_by_store, params_negative

        response_body = JSON::parse(response.body)
        expect(response_body["success"]).to be_false
      end
    end

    context "store id doesn't exists" do
      let(:params) { { id: 10000 } }

      it "returns 404 status" do
        get :articles_by_store, params

        response_body = JSON::parse(response.body)
        expect(response_body["error_code"]).to eq 404
      end

      it "answers with a message" do
        get :articles_by_store, params

        response_body = JSON::parse(response.body)
        expect(response_body["error_msg"]).to eq "Record not Found"
      end

      it "answers with a success false" do
        get :articles_by_store, params

        response_body = JSON::parse(response.body)
        expect(response_body["success"]).to be_false
      end
    end
  end
end

