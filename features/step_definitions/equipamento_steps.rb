When('executo a chamada no servico de equipamentos informando um protocolo {string}') do |tp_protocol|
  @equipamento = Equipamento.new
  $cad_equip = @equipamento.cadastra_equipamento(tp_protocol)
end

Then('devo receber o codigo {int}') do |status_code|
  expect($cad_equip.code).to eq(status_code)
end

Then('recebo a mensagem de sucesso.') do
  msg_equip_sucesso = $param_messages['equipamento_cadastrado_sucesso'].gsub('<nome_equip>', $faker_equip_e_exame)
  expect($cad_equip.gsub(/[']/, '')).to eql(msg_equip_sucesso)
end

Then('a mensagem de protocolo nao suportado.') do
  msg_equip_nao_suportado = $param_messages['equipamento_nao_suportado'].gsub('<nome_protocolo>', $faker_equip_e_exame)
  expect($cad_equip.gsub(/[']/, '')).to include(msg_equip_nao_suportado)
end
