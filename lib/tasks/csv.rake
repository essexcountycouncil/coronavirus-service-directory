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
            categories.push("Support for younger children")
        end
        if row[9] && row[9].downcase.strip == "yes"
            categories.push("Support for older children")
        end
        if row[10] && row[10].downcase.strip == "yes"
            categories.push("Adult support")
        end
        if row[11] && row[11].downcase.strip == "yes"
            categories.push("Support for all ages")
        end        
        service.category = categories


        age_group = []
        if row[8] && row[8].downcase.strip == "yes"
            age_group.push("younger children")
        end
        if row[9] && row[9].downcase.strip == "yes"
            age_group.push("older children")
        end
        if row[10] && row[10].downcase.strip == "yes"
            age_group.push("adults")
        end
        if row[11] && row[11].downcase.strip == "yes"
            age_group.push("all ages")
        end
        service.age = age_group    

        service.url = row[12]
        service.phone = row[13]
        service.email = row[14]
        service.postcode = row[15]
        # ...
        service.recommended = row[18]
        service.key_point_1 = row[19]
        service.key_point_2 = row[20]
        service.key_point_3 = row[21]
        service.how_to_contact = row[22]

        service.save
    end
end