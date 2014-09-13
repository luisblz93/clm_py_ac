#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"
require "date"


CSV.foreach('db/ubi.csv') do |row|
	Ubigeo.create(
	  :string_ubigeo_descripcion => row[1], 
    :int_ubigeo_departamento => row[2],
    :int_ubigeo_provincia => row[3],
    :int_ubigeo_distrito => row[4],
    :int_ubigeo_dependencia => row[5],
    :float_ubigeo_latitud => row[6],
    :float_ubigeo_longitud => row[7])
end

User.create(
      :email => "cleivors7@gmail.com",
      :password => "12345678",
      :var_usuario_nombre => "ELIAS",
      :var_usuario_apellido=> "TINTAYA"
      )

Iglesia.create(
 :dat_iglesia_fecregistro => DateTime.now(),
 :dat_iglesia_feccreacion => DateTime.now(),
 :var_iglesia_telefono => "064-211399",
 :var_iglesia_siglas => "N. J.",
 :var_iglesia_nombre => "IGLESIA NUEVA JERUSALEN",
 :var_iglesia_direccion => "AV. REAL Nº 956",
 :var_iglesia_referencia => "",
 :dou_iglesia_longitud => '-79.0288469nil',
 :dou_iglesia_latitud =>  '-8.112489',
 :ubigeo => Ubigeo.find(1354)
)

Lugar.create(
  :var_lugar_descripcion => 'Culto',
  :var_lugar_estado => '1'
  )

persona = Persona.create(
  :var_persona_dni => "23214657", 
  :var_persona_nombres => "ELIAS",
  :var_persona_apellidos => "TINTAYA CAMACLLANQUI",
  :var_persona_sexo => "M",
  :var_persona_profesion => "Pastor",
  :dat_persona_fecNacimiento => nil,
  :dat_persona_fecregistro => DateTime.now(),
  :var_persona_estado => "1",
  :var_persona_email => "cleivors7@gmail.com",
  :iglesia => Iglesia.first,
  :lugar => Lugar.first)

Direccion.create(
  :var_direccion_descripcion => nil, 
  :var_direccion_referencia => nil,
  :dou_direccion_longitud => nil, :dou_direccion_latitud => nil , 
  :var_direccion_estado => "1", :ubigeo => Ubigeo.find(1354),
  :persona => persona)

NivelCrecimiento.create(
  :int_nivelcrecimiento_escala => 1 ,
  :int_nivelcrecimiento_estadoactual => 0,
  :persona => persona)

NivelCrecimiento.create(
  :int_nivelcrecimiento_escala => -1 ,
  :int_nivelcrecimiento_estadoactual => 1,
  :persona => persona)

Peticion.create(
  :var_peticion_motivooracion => nil,
  :persona => persona , :dat_peticion_fecha => DateTime.now())

=begin CSV.foreach('db/p3.csv') do |pers|
      persona = Persona.create(
        :var_persona_dni => pers[0], 
            :var_persona_nombres => pers[1],
            :var_persona_apellidos => pers[2],
            :var_persona_sexo => pers[4],
            :var_persona_profesion => pers[7],
            :dat_persona_fecNacimiento => pers[9],
            :dat_persona_fecregistro => DateTime.now(),
            :var_persona_estado => "1",
            :var_persona_email => nil,
            :iglesia => Iglesia.first,
            :lugar => Lugar.first)

      Direccion.create(
        :var_direccion_descripcion => pers[5], 
        :var_direccion_referencia => nil,
        :dou_direccion_longitud => nil, :dou_direccion_latitud => nil , 
        :var_direccion_estado => "1", :ubigeo => Ubigeo.find(1354),
        :persona => persona)

      NivelCrecimiento.create(
            :int_nivelcrecimiento_escala => 1 ,
                        :int_nivelcrecimiento_estadoactual => 1,
                        :persona => persona)

      Peticion.create(
            :var_peticion_motivooracion => nil,
                        :persona => persona , :dat_peticion_fecha => pers[10])
end
=end
Menu.create(
      :var_menu_nombre =>  "persona",
      :var_menu_path => "app.persona_guardar_path",
      :int_menu_nivel => 1,
      :int_new_dep => 1
      )

Menu.create(
      :var_menu_nombre =>  "diezmo",
      :var_menu_path => "app.diezmos_path",
      :int_menu_nivel => 1,
      :int_new_dep => 1
      )

Menu.create(
      :var_menu_nombre =>  "ofrenda",
      :var_menu_path => "app.ofrendas_path" ,
      :int_menu_nivel => 1,
      :int_new_dep => 1
      )
Menu.create(
      :var_menu_nombre =>  "asistencia",
      :var_menu_path => "app.asistencia_path",
      :int_menu_nivel => 1,
      :int_new_dep => 1
      )

Menu.create(
      :var_menu_nombre =>  "informacion",
      :var_menu_path => "informacion",
      :int_menu_nivel => 1,
      :int_new_dep => 1
      )
Menu.create(
      :var_menu_nombre =>  "configuracion",
      :var_menu_path => "configuracion",
      :int_menu_nivel => 1,
      :int_new_dep => 1
      )
Menu.create(
      :var_menu_nombre =>  "reporte",
      :var_menu_path => "reporte",
      :int_menu_nivel => 1,
      :int_new_dep => 1
      )

Menu.all.each do |menu|
  UsuarioMenu.create!(
    :user => User.first,
    :menu => menu
    )
end

Constante.create(
  :var_constante_descripcion => "Tipo de Servicio",
  :int_constante_clase => 1,
  :int_constante_valor => 0
)
Constante.create(
  :var_constante_descripcion => "Culto Principal",
  :int_constante_clase => 1,
  :int_constante_valor => 1
)

Constante.create(
  :var_constante_descripcion => "Reu de Jovenes",
  :int_constante_clase => 1,
  :int_constante_valor => 2
)

Constante.create(
  :var_constante_descripcion => "Tipo Categoria",
  :int_constante_clase => 2,
  :int_constante_valor => 0
)

Chart.create(
      :int_chart_anio => 2013,
      :int_chart_mes => 1,
      :int_chart_miembro => 100,
      :int_chart_visita => 20,
      :int_chart_joven => 80,
      :int_chart_adulto => 20,
      :int_chart_adolescente => 40,
      :int_chart_ninio => 30,
      )

Chart.create(
      :int_chart_anio => 2013,
      :int_chart_mes => 2,
      :int_chart_miembro => 90,
      :int_chart_visita => 10,
      :int_chart_joven => 70,
      :int_chart_adulto => 10,
      :int_chart_adolescente => 30,
      :int_chart_ninio => 20,
      )

Chart.create(
      :int_chart_anio => 2013,
      :int_chart_mes => 3,
      :int_chart_miembro => 80,
      :int_chart_visita => 30,
      :int_chart_joven => 60,
      :int_chart_adulto => 30,
      :int_chart_adolescente => 50,
      :int_chart_ninio => 40,
      )

Chart.create(
      :int_chart_anio => 2013,
      :int_chart_mes => 4,
      :int_chart_miembro => 100,
      :int_chart_visita => 20,
      :int_chart_joven => 75,
      :int_chart_adulto => 50,
      :int_chart_adolescente => 40,
      :int_chart_ninio => 30,
      )

Chart.create(
      :int_chart_anio => 2013,
      :int_chart_mes => 5,
      :int_chart_miembro => 50,
      :int_chart_visita => 30,
      :int_chart_joven => 60,
      :int_chart_adulto => 40,
      :int_chart_adolescente => 30,
      :int_chart_ninio => 50,
      )

Chart.create(
      :int_chart_anio => 2013,
      :int_chart_mes => 6,
      :int_chart_miembro => 120,
      :int_chart_visita => 30,
      :int_chart_joven => 30,
      :int_chart_adulto => 90,
      :int_chart_adolescente => 10,
      :int_chart_ninio => 10,
      )

Chart.create(
      :int_chart_anio => 2013,
      :int_chart_mes => 7,
      :int_chart_miembro => 130,
      :int_chart_visita => 30,
      :int_chart_joven => 70,
      :int_chart_adulto => 30,
      :int_chart_adolescente => 60,
      :int_chart_ninio => 40,
      )

Chart.create(
      :int_chart_anio => 2013,
      :int_chart_mes => 8,
      :int_chart_miembro => 120,
      :int_chart_visita => 20,
      :int_chart_joven => 60,
      :int_chart_adulto => 40,
      :int_chart_adolescente => 50,
      :int_chart_ninio => 20,
      )

Chart.create(
      :int_chart_anio => 2013,
      :int_chart_mes => 9,
      :int_chart_miembro => 10,
      :int_chart_visita => 50,
      :int_chart_joven => 60,
      :int_chart_adulto => 40,
      :int_chart_adolescente => 20,
      :int_chart_ninio => 50,
      )

Chart.create(
      :int_chart_anio => 2013,
      :int_chart_mes => 9,
      :int_chart_miembro => 30,
      :int_chart_visita => 50,
      :int_chart_joven => 30,
      :int_chart_adulto => 40,
      :int_chart_adolescente => 40,
      :int_chart_ninio => 30,
      )

Chart.create(
      :int_chart_anio => 2013,
      :int_chart_mes => 10,
      :int_chart_miembro => 180,
      :int_chart_visita => 40,
      :int_chart_joven => 60,
      :int_chart_adulto => 40,
      :int_chart_adolescente => 30,
      :int_chart_ninio => 50,
      )

Chart.create(
      :int_chart_anio => 2013,
      :int_chart_mes => 11,
      :int_chart_miembro => 200,
      :int_chart_visita => 40,
      :int_chart_joven => 90,
      :int_chart_adulto => 50,
      :int_chart_adolescente => 60,
      :int_chart_ninio => 20,
      )

Chart.create(
      :int_chart_anio => 2013,
      :int_chart_mes => 12,
      :int_chart_miembro => 100,
      :int_chart_visita => 50,
      :int_chart_joven => 80,
      :int_chart_adulto => 60,
      :int_chart_adolescente => 40,
      :int_chart_ninio => 10,
      )

sql = ""
source = File.new("db/functions.sql", "r")
while (line = source.gets)
  sql << line
end
source.close
ActiveRecord::Base.connection.execute(sql)