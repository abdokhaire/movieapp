require 'elasticsearch/model'

class Movie < ApplicationRecord
    has_many :reviews
    has_many :locations
    has_many :actors, through: :locations

    before_create :slugify

    def slugify
        self.slug = name.parameterize
    end

    def avg_score
        return 0 unless reviews.size.positive?

        reviews.average(:stars).to_f.round(2)
    end
end

Movie.import