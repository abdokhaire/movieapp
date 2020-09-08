module Api
    module V1
      class MoviesController < ApplicationController
        protect_from_forgery with: :null_session
        
        def index
            movies = Movie.all
    
            render json: MovieSerializer.new(movies, options).serialized_json
          end

          def show
            movie = Movie.find_by(slug: params[:slug])
    
            render json: MovieSerializer.new(movie, options).serialized_json
          end


          private
          def options
            @options ||= { include: %i[reviews] }
          end

      end
    end
  end