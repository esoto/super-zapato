class Services::StoresController < Services::ServicesController
  respond_to :json

  before_filter :validate_params, only: [:articles_by_store]

  def index
    stores = Store.all
    render_success(stores: stores, total_elements: stores.count)
  end

  def articles_by_store
    if store = Store.includes(:articles).find_by_id(params[:id])
      articles = store.articles
      render_success(articles: articles, total_elements: articles.count)
    else
      render_failure(error_msg: "Record not Found", error_code: 404)
    end
  end

  private
  def validate_params
    if params["id"]
      render_failure(error_msg: "Bad Request", error_code: 400) unless params[:id].to_i > 0
    end
  end
end
