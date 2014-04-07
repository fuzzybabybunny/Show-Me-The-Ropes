require 'bcrypt'

PASSWORD_RESET_EXPIRES = 4

class User < ActiveRecord::Base

  attr_accessor :password, :password_confirmation

  before_save :set_random_password, :encrypt_password
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, confirmation: true

  def self.authenticate(email, password)
    user = User.find_by email: email
    user if user and user.authenticate(password)
  end

  def self.find_by_code code
    if user = User.find_by({:code => code, :expires_at => {"$gte" => Time.now.gmtime}})
      user.set_expiration
    end
    user
  end

  def authenticate(password)
    self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end

  def set_password_reset
    self.code = SecureRandom.urlsafe_base64
    set_expiration
  end

  def set_expiration
    self.expires_at = PASSWORD_RESET_EXPIRES.hours.from_now
    self.save
  end

  def reset_password (params)
    if params[:password].blank?
      self.errors.add(:password, "can't be blank")
      false
    else
      if self.update_attributes(params)
        self.update_attributes(params.merge( code: nil, expires_at: nil ))
      end
    end
  end

  def total_beer
    beers = 0
    for drinks in self.binge
      beers = beers + drinks.beer.to_i
    end
    return beers
  end

  def total_wine
    wine = 0
    for drinks in self.binge
      wine = wine + drinks.wine.to_i
    end
    return wine
  end

  def total_cocktail
    cocktail = 0
    for drinks in self.binge
      cocktail = cocktail + drinks.cocktail.to_i
    end
    return cocktail
  end

  def beercost
    beercost = 0
    for drink in self.binge
      beercost = beercost + (drink.beercost.to_i * drink.beer.to_i)
    end
    return beercost
  end

  def winecost
    winecost = 0
    for drink in self.binge
      winecost = winecost + (drink.winecost.to_i * drink.wine.to_i)
    end
    return winecost
  end

  def cocktailcost
    cocktailcost = 0
    for drink in self.binge
      cocktailcost = cocktailcost + (drink.cocktailcost.to_i * drink.cocktail.to_i)
    end
    return cocktailcost
  end

  def beerunit
    beerunit = 0
    for drink in self.binge
      beerunit = beerunit + (drink.beerunit.to_i * drink.beer.to_i)
    end
    return @total_beer_units = beerunit
  end

  def wineunit
    wineunit = 0
    for drink in self.binge
      wineunit = wineunit + (drink.wineunit.to_i * drink.wine.to_i)
    end
    return @total_wine_units = wineunit
  end

  def cocktailunit
    cocktailunit = 0
    for drink in self.binge
      cocktailunit = cocktailunit + (drink.cocktailunit.to_i * drink.cocktail.to_i)
    end
    return @total_cocktail_units = cocktailunit
  end


  protected

  def set_random_password
    if self.fish.blank? and password.blank?
      self.salt = BCrypt::Engine.generate_salt
      self.fish = BCrypt::Engine.hash_secret(SecureRandom.base64(32), self.salt)
    end
  end

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.fish = BCrypt::Engine.hash_secret(password, self.salt)
    end
  end

end
