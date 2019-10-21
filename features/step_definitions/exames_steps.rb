When('executo a chamada no servico de exame informando um equipamento {string}') do |tp_equipamento|
  @exames = Exames.new
  @exames.cadastra_exame(tp_equipamento)
end

Então('devo receber o codigo {int} do servico de exame') do |status_code|
  expect($cad_exame.code).to eq(status_code)
end

Then('a mensagem de exame inserido com sucesso') do
  msg_exame_sucesso = $param_messages['exame_cadastrado_sucesso'].gsub('<nome_exame>', $faker_exame)
  expect($cad_exame.gsub(/[']/, '')).to eq(msg_exame_sucesso)
end

Then('a mensagem informando que equipamento não existe') do
  msg_exame_nao_existe = $param_messages['exame_equip_nao_cadastrado'].gsub('<equip_nao_existe>', 'TSTJM')
  expect($cad_exame.gsub(/[']/, '')).to eq(msg_exame_nao_existe)
end
