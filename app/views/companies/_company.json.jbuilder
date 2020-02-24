json.extract! company, :id, :company_name, :postal_code, :address, :created_at, :updated_at
json.url company_url(company, format: :json)
