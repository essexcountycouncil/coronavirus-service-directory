class ServicesController < ApplicationController

    def search
        @categories = Service.categories
    end

    def index
        results = search

        if params[:categories].blank?
            redirect_to search_services_path, :notice => "Please make sure you have selected an area you need help with."
        end        

        if results.length > 0
            @top_result = Service
                .where("recommended = TRUE AND category && ARRAY[?]::varchar[]", params[:categories])
                .limit(1)

            @result = results.first

            if @top_result.length > 0
                if params[:categories]
                    @services = Service
                        .where("category && ARRAY[?]::varchar[] AND id != ?", params[:categories], @top_result[0].id)    
                else
                    @services = Service
                        .where("id != ?", @top_result[0].id)   
                end
            else
                if params[:categories]
                    @services = Service
                        .where("category && ARRAY[?]::varchar[]", params[:categories])                 
                else
                    @services = Service                        
                end
            end
        else
            redirect_to search_services_path, :notice => "Couldn't find any services near that location. Please make sure your location is a valid Camden area."
        end
    end 

end