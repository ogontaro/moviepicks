# frozen_string_literal: true

class MoviePicksServerSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
