# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
categories = ['Metaphysics', 'Logic', 'Epistemology', 'Axiology', 'Ethics', 'Political Philosophy', 'Aesthetics']# Outlines  an array of category names to be added to the database
# Find or create a category with the given catname and if it exists its not created again
categories.each do |category_name|
  Category.find_or_create_by(catname: category_name)
end
