class Rol < ActiveRecord::Base
  has_and_belongs_to_many :usuarios, :inverse_of => :roles
end
