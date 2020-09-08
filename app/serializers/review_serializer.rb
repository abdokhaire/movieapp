class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :review, :stars, :movie_id, :reviewer_id, :name
end
