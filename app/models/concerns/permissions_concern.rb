module PermissionsConcern
	extend ActiveSupport::Concern
	def is_secretary?
		self.permission_level == '1'
	end

	def is_team?
		self.permission_level == '2'
	end

	def is_admin?
		self.permission_level == '3'
	end
end