class User < ActiveRecord::Base
    has_many :appointments

    has_secure_password
  end