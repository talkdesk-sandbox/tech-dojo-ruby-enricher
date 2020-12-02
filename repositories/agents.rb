# frozen_string_literal: true

require 'rest-client'
require 'json'

require_relative '../seeds/contacts.rb'

class AgentsRepository
  include Seeds

  def find_by_id(id)
    agent_list.detect do |agent|
      agent[:id] == id
    end
  end
end
