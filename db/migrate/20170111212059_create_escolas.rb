class CreateEscolas < ActiveRecord::Migration[5.0]
  def change
    create_table :escolas do |t|
      t.integer :id_escola_api
      t.string :nome
      t.string :cidade
      t.integer :id_cidade_api
      t.string :sigla_estado
      t.integer :id_estado_api
      t.string :dependencia_administrativa
      t.string :estado_de_regulamentacao
      t.string :situacao_de_funcionamento
      t.string :tipo_de_localizacao

      t.timestamps
    end
  end
end
