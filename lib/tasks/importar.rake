namespace :importar do
  desc "Importa as escolas do Brasil para o banco de dados"
  task escola: :environment do
    require 'net/http'
    require 'json'

    def create_request(uri_string)
      uri = URI.parse(uri_string)
      request = Net::HTTP::Get.new(uri)
      request["Cookie"] = "_eventqueue=%7B%22heatmap%22%3A%5B%5D%2C%22events%22%3A%5B%5D%7D; _jsuid=4276510794"
      request["X-Newrelic-Id"] = "VQICWF9UABADUFZUAAUCXw=="
      request["Accept-Language"] = "pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4"
      request["User-Agent"] = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36"
      request["Accept"] = "application/json, text/javascript, */*; q=0.01"
      request["Referer"] = "http://www.qedu.org.br/busca"
      request["X-Requested-With"] = "XMLHttpRequest"
      request["Connection"] = "keep-alive"

      return request
    end

    def send_request(req)
      req_options = {
        use_ssl: req.uri.scheme == "https",
      }
      response = Net::HTTP.start(req.uri.hostname, req.uri.port, req_options) do |http|
        http.request(req)
      end
    end

    (101..127).each do |estado|
      request = create_request("http://www.qedu.org.br/api/states/#{estado}/cities/?limit=10000")
      response = send_request(request)
      json = JSON.parse(response.read_body)

      cidades = json['data']
      cidades.each do |cidade|
        request = create_request("http://www.qedu.org.br/api/cities/#{cidade['id']}/schools/?limit=10000&count=1")
        response = send_request(request)
        json = JSON.parse(response.read_body)

        escolas = json['data']
        novas_escolas = []
        escolas.each do |escola|
          novas_escolas << { 
            nome: escola['name'],
            id_escola_api: escola['id'],
            cidade: cidade['name'],
            id_cidade_api: cidade['id'],
            sigla_estado: escola['state']['acronym'],
            dependencia_administrativa: escola['dependence']['name'],
            situacao_de_funcionamento: escola['is_operational'] 
          }
        end
        Escola.create(novas_escolas)
      end
    end
  end
end
