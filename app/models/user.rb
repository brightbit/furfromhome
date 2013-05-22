class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Callbacks
  after_save :invalidate_devise_cache

  # Methods
  def self.serialize_from_session(key, salt)
    single_key = key.is_a?(Array) ? key.first : key
    Rails.cache.fetch("user:#{single_key}") { User.find(single_key) }
  end

  def update_with_password(params={})
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    update_attributes(params)
  end

  private
  def invalidate_devise_cache
    Rails.cache.delete("user:#{id}")
  end
end
