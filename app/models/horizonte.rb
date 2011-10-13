# -*- encoding : utf-8 -*-
class Horizonte < ActiveRecord::Base
  has_one :analisis,      :dependent => :destroy
  has_one :color,         :dependent => :destroy
  has_one :limite,        :dependent => :destroy
  has_one :consistencia,  :dependent => :destroy
  has_one :estructura,    :dependent => :destroy
  has_many :texturas, :through => :analisis
  belongs_to :calicata
end
