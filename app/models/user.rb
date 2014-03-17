class User < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :password, presence: true
	after_destroy :ensure_an_admin_remains
	has_secure_password

	private
		def ensure_an_admin_remains
			if User.count.zero?
				raise "Последний пользователь не может быть удален"
			end
		end
end
