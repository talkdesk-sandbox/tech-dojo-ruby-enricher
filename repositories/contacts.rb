# frozen_string_literal: true

require 'rest-client'
require 'json'

require_relative '../seeds/contacts.rb'

class ContactsRepository
  include Seeds

  def find_by_id(_id)
    contact_list[0]
  end
end
