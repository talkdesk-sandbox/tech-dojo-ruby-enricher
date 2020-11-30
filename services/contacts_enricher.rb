# frozen_string_literal: true

require_relative '../repositories/contacts.rb'

module Services
  class ContactsEnricher
    def initialize(options: {})
      @fields = options.fetch(:fields, [])
      @contacts_repository = options.fetch(:contacts_repository) { ContactsRepository.new }
    end

    def enrich(contact_id)
      @contacts_repository.find_by_id(contact_id)
    end
  end
end
