class Exames
  include HTTParty
  require_relative '../hooks/dasa_hooks'

  def cadastra_exame(tp_equipamento)
    case tp_equipamento
    when 'cadastrado'
      equip = 'SIEMENS'
    when 'não cadastrado'
      equip = 'TSTJM'
    end
    body = {
      "codigo": $faker_exame,
      "codigoInterface": 'COD A',
      "material": 'SORO',
      "equipamento": equip
    }

    $cad_exame = HTTParty.post(CONFIG['base_uri'] + '/exames',
                               body: body.to_json,
                               headers: {
                                 'Accept' => 'application/json',
                                 'Content-Type' => 'application/json'
                               })
  end
end
