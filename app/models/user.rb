class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email
  field :password_salt
  field :password_hash
  field :role


    has_many :merchants

    attr_accessor :password
    attr_accessible :email, :password, :password_confirmation, :role
    before_save :encrypt_password

    validates_confirmation_of :password
    validates_presence_of :password, :on => :create
    validates_presence_of :email
    validates_uniqueness_of :email

    ROLES = %w[admin merchant user]

    def encrypt_password
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end

    def self.authenticate(email, password)
        user = self.where(:email => email).first
        if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
          user
        else
          nil
        end
    end

end
