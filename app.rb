# frozen_string_literal: true

require 'sinatra'
require 'json'

require_relative 'services/contacts_enricher.rb'
require_relative 'services/agents_enricher.rb'

before do
  request.body.rewind
  @request_payload = JSON.parse request.body.read
end

after do
  response.body = JSON.dump(response.body)
end

get '/' do
  { 'message': 'Hello world!' }
end

get '/enrich' do
  resp = {}

  if @request_payload.key?('contact')
    contact_id = @request_payload['contact']['id']
    contact_fields = @request_payload['contact']['fields']
    resp['contact'] = Services::ContactsEnricher.new.enrich(contact_id, contact_fields)
  end

  if @request_payload.key?('agent')
    contact_id = @request_payload['agent']['id']
    contact_fields = @request_payload['agent']['fields']
    resp['agent'] = Services::AgentsEnricher.new.enrich(contact_id, contact_fields)
  end

  resp
end
