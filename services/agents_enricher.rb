# frozen_string_literal: true

require_relative '../repositories/agents.rb'

module Services
  class AgentsEnricher
    def initialize(options: {})
      @fields = options.fetch(:fields, [])
      @agents_repository = options.fetch(:agents_repository) { AgentsRepository.new }
    end

    def enrich(agent_id, fields)
      fields.push('id')
      @agents_repository.find_by_id(agent_id).select do |key, _|
        fields.include?(key.to_s)
      end
    end
  end
end
