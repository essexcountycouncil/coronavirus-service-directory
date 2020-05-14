require 'csv'

task :csv => :environment do
    Service.destroy_all

    response = HTTParty.get(ENV["DATASOURCE"])
    rows = CSV.parse(response.body, headers: true)

    # byebug

    rows.drop(3).each do |row|
        service = Service.new

        service.name = row[0]
        service.description = row[1]

        categories = []
        if row[2] && row[2].downcase.strip == "yes"
            categories.push("Understanding coronavirus")
        end
        if row[3] && row[3].downcase.strip == "yes"
            categories.push("Managing and coping with change")
        end
        if row[4] && row[4].downcase.strip == "yes"
            categories.push("Separation and loss")
        end
        if row[5] && row[5].downcase.strip == "yes"
            categories.push("Manging and coping with anxiety")
        end     
        if row[6] && row[6].downcase.strip == "yes"
            categories.push("Maintaining healthy relationships")
        end
        if row[7] && row[7].downcase.strip == "yes"
            categories.push("Staying active and curious")
        end  
        if row[8] && row[8].downcase.strip == "yes"
            categories.push("Education and learning")
        end      
        service.category = categories


        ages = []
        if row[9] && row[9].downcase.strip == "yes"
            ages.push("Child")
        end
        if row[10] && row[10].downcase.strip == "yes"
            ages.push("Young person")
        end
        if row[11] && row[11].downcase.strip == "yes"
            ages.push("Parent")
        end
        if row[12] && row[12].downcase.strip == "yes"
            ages.push("Adult")
        end        
        if row[13] && row[13].downcase.strip == "yes"
            ages.push("All ages")
        end
        service.age = ages    

        service.url = row[14]
        service.phone = row[15]
        service.email = row[16]
        service.postcode = row[17]
        # ...
        service.recommended = row[20]
        service.key_point_1 = row[21]
        service.key_point_2 = row[22]
        service.key_point_3 = row[23]
        service.how_to_contact = row[24]

        service.save
    end
end