# # freeze_string_literal: true
# require 'rails_helper'
#
# RSpec.describe TurboClone::StreamsController, type: :request do
#   describe "POST #create" do
#     it "redirects to articles_path with HTML format" do
#       post articles_path, params: { article: { content: "something" } }
#       expect(response).to redirect_to(articles_path)
#     end
#
#     it "returns turbo_stream with turbo_stream format" do
#       post articles_path, params: { article: { content: "something" } }, as: :turbo_stream
#       expect(response.body).to include('<turbo-stream action="prepend" target="articles">')
#     end
#   end
# end