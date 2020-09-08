# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Review.destroy_all
Reviewer.destroy_all
Location.destroy_all
Movie.destroy_all
Actor.destroy_all


CSV.foreach(Rails.root.join('lib', 'seeds', 'movies.csv'), headers: true, encoding: 'ISO-8859-1', converters: :numeric) do |row|
    
    mov = Movie.new
    if !Movie.exists?(:name => row['Movie'])
        mov.name = row['Movie']
        mov.description = row['Description']
        mov.director = row['Director']
        mov.year = row['Year']
        mov.save
    else
        mov = Movie.find_by(name: row['Movie'])
    end

    act = Actor.new
    if !Actor.exists?(:name => row['Actor'])
        act.name = row['Actor']
        act.save
    else
        act = Actor.find_by(name: row['Actor'])
    end

    loc = Location.new
    loc.name = row['Filming location']
    loc.country = row['Country']
    loc.movie = mov
    loc.actor = act
    loc.save

end
  
puts "There are now #{Movie.count} rows in the Movies table"
puts "There are now #{Actor.count} rows in the Actors table"
puts "There are now #{Location.count} rows in the Locations table"


CSV.foreach(Rails.root.join('lib', 'seeds', 'reviews.csv'), headers: true, encoding: 'ISO-8859-1', converters: :numeric) do |row|
    

    rev = Reviewer.new
    if !Reviewer.exists?(:name => row['User'])
        rev.name = row['User']
        rev.save
    else
        rev = Reviewer.find_by(name: row['User'])
    end

    t = Review.new
    t.review = row['Review']
    t.stars = row['Stars']
    t.reviewer = rev
    t.movie = Movie.find_by(name: row['Movie'])
    t.save
    
end

puts "There are now #{Review.count} rows in the Reviews table"