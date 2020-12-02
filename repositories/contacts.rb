# frozen_string_literal: true

require 'rest-client'
require 'json'

require_relative '../seeds/contacts.rb'

class ContactsRepository
  include Seeds

  def find_by_id(id)
    contact_list.detect do |contact|
      contact[:id] == id
    end
  end
end
