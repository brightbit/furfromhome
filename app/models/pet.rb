class Pet < ActiveRecord::Base
  belongs_to :breed
  belongs_to :user
end
