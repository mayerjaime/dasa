When('executo a chamada no servico de ordens informando um exame {string}') do |tp_exame|
  @ordens = Ordens.new
  @ordens.cadastra_ordens(tp_exame)
end

Then('devo receber o codigo {int} do servico de ordens') do |status_code|
  expect($cad_ordens.code).to eq(status_code)
  puts $cad_ordens
end

Then('a mensagem de ordem inserido com sucesso') do
  expect($cad_ordens.parsed_response['amostras'][0]['codigoBarras']).to be_a_kind_of(String)
  expect($cad_ordens.parsed_response['amostras'][0]['codigoBarras']).not_to be_empty
  puts $cad_ordens
end

Then('a mensagem informando que o exame nao foi encontrado') do
  msg_exame_nao_encontrado = $param_messages['ordem_exame_nao_cadastrado'].gsub('<cod_exame>', 'EXAMENCJM')
  expect($cad_ordens.gsub(/[']/, '')).to eq(msg_exame_nao_encontrado)
  puts $cad_ordens
end

Given('que faco o cadastro da orderm com o seguintes exames') do |table|
  info_exame = table.hashes
  info_exame.each do |tbl_exame|
    @ordens = Ordens.new
    @ordens.cadastra_ordens_quatro_exames(tbl_exame)
  end
end

Then('o response deve retornar o codigo de barras dos exames cadastrados') do
  expect($cad_ordens.parsed_response['amostras'][0]['codigoBarras']).to be_a_kind_of(String)
  expect($cad_ordens.parsed_response['amostras'][0]['codigoBarras'][0]).not_to be_empty
  expect($cad_ordens.parsed_response['amostras'][0]['codigoBarras'][1]).not_to be_empty
  expect($cad_ordens.parsed_response['amostras'][0]['codigoBarras'][2]).not_to be_empty
end
