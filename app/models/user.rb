class User
  include ActiveAttr::Model

  attribute :login

  USERS = {
    root: 'root',
    editor: 'editor'
  }

  def self.find(id)
    new({login: id }) if USERS.key?(id.to_sym)
  end

  def self.authenticate(login, password)
    new({login: login}) if USERS[login.to_sym] == password
  end

  def editor?
    login == 'root'
  end

  def to_scrivito_user
    Scrivito::User.define(login) do |user|
      user.description { "#{login}" }
      if editor?
        #allow everything
        Scrivito::User::VERBS.each do |can_have|
          user.can_always(can_have, :workspace)
        end
        # user.restrict_obj_publish(user: :_path) do |path|
        #   if path.starts_with?("/investors") && !user.has_permission?("publish_investor")
        #     "You are not permitted to do stuff"
        # end
      else
        Scrivito::User::VERBS.select { |verb| verb != :read }.each do |can_have|
          user.can_never(can_have, :workspace)
        end
      end
    end
  end
end
