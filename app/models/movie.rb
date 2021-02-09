class Movie < ActiveRecord::Base
  def self.with_ratings(ratings_list, sort)
  # if ratings_list is an array such as ['G', 'PG', 'R'], retrieve all
  #  movies with those ratings
  # if ratings_list is nil, retrieve ALL movies
    if ratings_list == [] and !sort.nil?
      return self.all.order(sort)
    elsif ratings_list == []
      return self.all
    end
    
    if sort != nil
      self.where(rating: ratings_list).order(sort)
    else
      self.where(rating: ratings_list)
    end
  end
  
  def self.all_ratings()
    ['G','PG','PG-13','R']
  end
end
