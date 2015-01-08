class TodoItem
	attr_reader :name
	def initialize(name)
		@name = name
		@complete = false
	end

	def to_s
		if complete?
			"[C] #{name}"
		else
			"[I] #{name}"
		end
	end

	def complete?
		@complete
	end

	def set_complete!
		@complete = true
	end

	def set_incomplete!
		@complete = false
	end
end