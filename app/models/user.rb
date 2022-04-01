class User < ApplicationRecord

  def full_name
    return self.name_title + ' ' + self.name_first + ' ' + self.name_last
  end

  def self.search(search)
    if search 
      User.where("lower(name_first) LIKE :search or lower(name_last) LIKE :search", search: "%" + search.downcase + "%") 
    else
      User.all
    end
  end
end
