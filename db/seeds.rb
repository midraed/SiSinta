# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#
# Carga el archivo en formato yaml (con erb embebido) del directorio
# +semillas+, que tiene datos iniciales para la base de datos
#
def cargar(datos)
  YAML::load(ERB.new(IO.read("#{Rails.root}/db/semillas/#{datos}.yml")).result)
end

#
# Carga los roles predefinidos
#
cargar('roles').each do |campo|
  campo.last.each do |v|
    Rol.send("find_or_create_by_#{campo.first}", v)
  end
end

#
# Carga de las tablas de Capacidad de uso
#
c = cargar('capacidades')
c['clases'].each_pair do |agrupamiento, clases|
  clases.each_pair do |codigo, descripcion|
    CapacidadClase.find_or_create_by_codigo(codigo).update_attributes :agrupamiento => agrupamiento, :descripcion => descripcion
  end
end
c['subclases'].each_pair do |codigo, descripcion|
  CapacidadSubclase.find_or_create_by_codigo(codigo).update_attribute(:descripcion, descripcion)
end

#
# Carga las tablas de lookup. Deben estar en la forma:
#
# modelo:
#   [valor 1, valor 2, valor 3, ...]
#
cargar('lookup').each do |modelo|
  modelo.last.each do |v|
    Kernel.const_get(modelo.first.camelcase).find_or_create_by_valor(v)
  end
end

#
# Carga el usuario administrador inicial
#
Usuario.create( :nombre => 'Administrador',
                :email => 'email@falso.com',
                :password => 'administrador').roles << Rol.find_by_nombre('administrador')
