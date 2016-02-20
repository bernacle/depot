class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password
  # after_destroy :ensure_an_admin_remains

  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user" # A raise causes an automatic rollback
        # The exception signals the error back to the controller
      end
    end

end
