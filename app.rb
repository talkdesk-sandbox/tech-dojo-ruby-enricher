# frozen_string_literal: true

require 'sinatra'
require 'json'

require_relative 'services/contacts_enricher.rb'

before do
  content_type :json
end

after do
  response.body = JSON.dump(response.body)
end

get '/' do
  { 'message': 'Hello world!' }
end

get '/enrich' do
  Services::ContactsEnricher.new.enrich('contact_id_1')
end
