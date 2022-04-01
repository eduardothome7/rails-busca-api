json.extract! user, :id, :name_title, :name_first, :name_last, :gender, :address, :number, :city, :postcode, :state, :country, :date_birth, :login, :password, :email, :picture_thumbnail, :picture_medium, :picture_large, :phone, :cell, :created_at, :updated_at
json.url user_url(user, format: :json)
