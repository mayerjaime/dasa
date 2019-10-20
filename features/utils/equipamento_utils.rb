class Equipamento
  include HTTParty
  require_relative '../hooks/dasa_hooks'

  def cadastra_equipamento(tp_protocol)
    case tp_protocol
    when 'valido'
      protocolo = 'ASTM'
    when 'invalido'
      protocolo = $faker_equip_e_exame
    end
    body = {
      "nome": $faker_equip_e_exame,
      "ip": '172.168.1.2',
      "porta": 8080,
      "protocolo": protocolo,
      "bidirecional": true,
      "fazQuery": true,
      "ativo": true,
      "conectado": false,
      "forcarConexaoDigiboard": true
    }

    $cad_equip = HTTParty.post(CONFIG['base_uri'] + '/equipamentos',
                               body: body.to_json,
                               headers: {
                                 'Accept' => 'application/json',
                                 'Content-Type' => 'application/json'
                               })
  end
end
