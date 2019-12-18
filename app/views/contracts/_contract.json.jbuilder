json.extract! contract, :id, :customer_id, :ninja_id, :description, :service_type, :date_accepted, :date_finished, :rating, :created_at, :updated_at
json.url contract_url(contract, format: :json)
