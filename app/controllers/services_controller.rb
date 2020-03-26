class ServicesController < ApplicationController

    def search
        @categories = Service.categories
    end

    def index
        results = Geocoder.search(params[:postcode], region: "gb")
        if results.length > 0
            @result = results.first.formatted_address
            if params[:categories]
                @services = Service
                .where("category && ARRAY[?]::varchar[]", params[:categories])
                .near(results.first.coordinates, 200)
            else
                @services = Service.near(results.first.coordinates, 200)
            end
        else
            redirect_to search_services_path, :notice => "Couldn't find any services near that location. Please make sure your location is a valid Buckinghamshire area."
        end
    end 

end