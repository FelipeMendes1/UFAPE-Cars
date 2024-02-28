Given('O veiculo de modelo {string}, ano {string}, quilometragem {string}, uso {string}, historico de manutencao {string} e valor de anuncio {string} existe') do |modelo, ano, quilometragem, uso, historico_manutencao, valor_anuncio|
  Usuario.create!(email: "teste@teste", password: "123456");
  visit 'usuarios/sign_in'
  fill_in 'Email', with: "teste@teste"
  fill_in 'Senha', with: "123456"
  click_button 'Entrar'
  visit '/veiculos/new'
  expect(page).to have_current_path('/veiculos/new')
  fill_in 'Modelo', with: modelo
  fill_in 'Ano', with: ano
  fill_in 'Quilometragem', with: quilometragem
  fill_in 'Uso', with: uso
  fill_in 'Historico manutencao', with: historico_manutencao
  fill_in 'Valor anuncio', with: valor_anuncio
  click_button 'Create Veiculo'
  expect(page).to have_content('Veiculo was successfully created.')
end

When('Eu clico em editar veiculo') do
  click_link 'Edit this veiculo'
end

When('Eu altero a quilometragem para {string}') do |quilometragem|
  fill_in 'Quilometragem', with: quilometragem
end

When('Eu clico no botao para atualizar o veiculo') do
  click_button 'Update Veiculo'
end

Then('Eu vejo uma mensagem de veiculo atualizado') do
  expect(page).to have_content('Veiculo was successfully updated.')
end