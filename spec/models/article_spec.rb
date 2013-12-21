require 'spec_helper'

describe Article, "#new" do
  subject { Article.new }

  its(:name) { should be_nil }
  its(:total_in_vault) { should be_nil }
  its(:total_in_shelf) { should be_nil }
  its(:store) { should be_nil }
  its(:price) { should be_nil }
  its(:description) { should be_nil }
end

describe Article, "#create" do
  context "validates presence of store id and name" do
    subject { Article.create(name: AN_ARTICLE_NAME, store_id: A_STORE_ID) }

    it { should validate_presence_of :name }
    it { should validate_presence_of :store_id }
  end
end
