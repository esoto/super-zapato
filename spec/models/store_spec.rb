require 'spec_helper'

describe Store, '#initialize' do
  subject { Store.new }

  its(:name) { should eq nil }
  its(:address) { should eq nil }
end

describe Store, "#create" do
  subject { Store.create(name: A_STORE_NAME, address: A_STORE_ADDRESS) }

  it { should validate_presence_of :name }
  its(:name) { should eq A_STORE_NAME }
  its(:address) { should eq A_STORE_ADDRESS }
end
