class Services::ArticlesController < Services::ServicesController
  include ServicesHelper
  respond_to :json

  def index
    articles = Article.all
    render_success(articles: articles, total_elements: articles.count)
  end
end
