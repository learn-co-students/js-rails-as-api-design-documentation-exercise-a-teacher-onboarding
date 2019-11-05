class DogController < ApplicationController

    # returns JSON dog data
    def search
        # example URL: http://localhost:3000/dog_search?query=princess&sort_field=size
        # the query local variable is assigned the search term,
        # whose key-value pair is present in the RESTful URL
        # the sort local variable is assigned the sort criteria,
        # whose key-value pair is also present in the RESTful URL
        # params key-value pairs are separated by &, 
        # key-value pairs are separated by =
        # ? denotes the start of params
        query = (params[:query] || "").downcase
        sort = params[:sort_field] || "name"

        # returns array of dogs whose name, breed, phrase, or size includes the query term
        dogs = Dog.all.select do |dog|
            dog.name.downcase.include?(query) ||
            dog.breed.downcase.include?(query) ||
            dog.phrase.downcase.include?(query) ||
            dog.size.downcase.include?(query)
        end

        # returns array of dogs sorted alphabetically by sort_field criteria
        dogs.sort_by!(&sort.to_sym)
        
        # renders array of dog objects as JSON
        render json: dogs
    end
end
