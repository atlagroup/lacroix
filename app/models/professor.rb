class Professor < Usuario

  def self.from_oauth(dados)
    where(provider: dados.provider, uid: dados.uid).first_or_create do |professor|
      professor.email = dados.info.email
      professor.password = Devise.friendly_token[0,20]
      professor.nome = dados.extra.raw_info.first_name
      professor.sobrenome = dados.extra.raw_info.last_name
      professor.nome_usuario = dados.extra.raw_info.username

      if dados.provider == "google_oauth2"
        professor.nome = dados.extra.raw_info.given_name
        professor.sobrenome = dados.extra.raw_info.family_name
      end
    end
  end
end
