# frozen_string_literal: true

require 'sinatra'
require 'json'

require_relative 'services/contacts_enricher.rb'

before do
  content_type :json
  request.body.rewind
  @request_payload = JSON.parse request.body.read
end

after do
  response.body = JSON.dump(response.body)
end

get '/' do
  { 'message': 'Hello world!' }
end

post '/enrich' do
  contact_id = @request_payload['contact']['id']
  fields = @request_payload['contact']['fields']

  Services::ContactsEnricher.new({ fields: fields }).enrich(contact_id)
end
