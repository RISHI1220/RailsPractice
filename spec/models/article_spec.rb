require 'rails_helper'

RSpec.describe Article, type: :model do
  context "Validation Test" do
    it "Title Presence" do
      article=Article.new(body: 'This is body test one for testing').save
      expect(article).to eq(false) 
    end
    it "Body Presence" do
      article=Article.new(title: 'Title One').save
      expect(article).to eq(false) 
    end
  end
end
