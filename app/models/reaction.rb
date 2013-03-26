class Reaction < ActiveRecord::Base
  attr_accessible :conditions, :doi, :name, :products, :reactionTransform, :synCount, :user
end
