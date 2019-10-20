class Ordens
  include HTTParty
  require_relative '../hooks/dasa_hooks'

  def cadastra_ordens(tp_exame)
    case tp_exame
    when 'cadastrado'
      exame1 = 'GLICO'
      exame2 = 'TSH'
    when 'nao cadastrado'
      exame1 = 'EXAMENCJM'
      exame2 = 'EXAMENCJMA'
    end
    body = {
      "nome": $faker_nomes,
      "nascimento": '13/11/1988',
      "sexo": 'M',
      "leito": 'Leito A',
      "centroDeOrigem": 'Centro A',
      "exames": [
        {
          "codigo": exame1
        },
        {
          "codigo": exame2
        }
      ]
    }

    $cad_ordens = HTTParty.post(CONFIG['base_uri'] + '/ordens',
                                body: body.to_json,
                                headers: {
                                  'Accept' => 'application/json',
                                  'Content-Type' => 'application/json'
                                })

    puts $cad_ordens
  end

  def cadastra_ordens_quatro_exames(tbl_exame)
    body = {
      "nome": $faker_nomes,
      "nascimento": '13/11/1988',
      "sexo": 'M',
      "leito": 'Leito A',
      "centroDeOrigem": 'Centro A',
      "exames": [
        {
          "codigo": tbl_exame[:Exame1]
        },
        {
          "codigo": tbl_exame[:Exame2]
        },
        {
          "codigo": tbl_exame[:Exame3]
        },
        {
          "codigo": tbl_exame[:Exame4]
        }
      ]
    }

    $cad_ordens = HTTParty.post(CONFIG['base_uri'] + '/ordens',
                                body: body.to_json,
                                headers: {
                                  'Accept' => 'application/json',
                                  'Content-Type' => 'application/json'
                                })

    puts $cad_ordens
  end
end
