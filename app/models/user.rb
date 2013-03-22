class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :password, :password_confirmation
  validates :password, :confirmation => true
  before_save :encrypt_password

  def self.authenticate(name, submitted_password) # class method!
   user = find_by_name(name) #this function is auto generate by model for the filed :name
   user && user.has_password?(submitted_password) ? user : nil
  end
  
  
  def has_password?(submitted_password)
   encrypted_password == encrypt(submitted_password) 
   #password == submitted_password
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
  
  private 
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end  
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end 
end
