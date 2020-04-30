class ServicesController < ApplicationController

    def search
        @categories = Service.categories
        @ages = Service.ages
    end

    def index        
        results = search     

        if params[:categories].blank? 
            redirect_to search_services_path, :notice => "Please make sure you have selected an area you need help with."
        elsif params[:ages].blank?
            redirect_to search_services_path, :notice => "Please make sure you have selected an age group."
        end        

        if results.length > 0

            @result = results.first

            if params[:categories] && params[:ages]
                @services = Service
                    .where("category && ARRAY[?]::varchar[]", params[:categories]).where("age && ARRAY[?]::varchar[]", params[:ages])                 
            else
                @services = Service                        
            end
        else            
            redirect_to search_services_path, :notice => "Couldn't find any services. Sorry."
        end      

    end 

end