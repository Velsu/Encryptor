require "./todoitem"

class TodoList
	attr_reader :name, :todo_items

	def initialize(name)
		@name = name
		@todo_items = []
	end

	def add_item(name)
		todo_items.push(TodoItem.new(name))
	end

	def remove_item(name)
		if index = find_index(name)
			todo_items.delete_at(index)
			return true
		else
			return false
		end
	end

	def set_complete(name)
		if index = find_index(name)
			todo_items[index].set_complete!
			return true
		else
			return false
		end
	end


	def find_index(name)
		index = 0
		found = false

		todo_items.each do |item|
			if item.name == name
			found = true
		end
		if found
			break
		else
			index += 1
		end
	end
		if found
			return index
		else
			return nil
		end
	end

	def print_list(type='all')

		puts "{#name} List - #{type} items"
		print '-' * 30 + "\n"



		todo_items.each do |item|
			case type
			when 'all'
			puts item
		when 'complete'
			puts item if item.complete?
		when 'incomplete'
			puts item unless item.complete?
		end
		end
	end

end


todo_list = TodoList.new("Groceries")
todo_list.add_item("Milk")
todo_list.add_item("Eggs")
todo_list.add_item("Bread")
todo_list.add_item("Butter")

if todo_list.remove_item("Eggs")
  puts "Eggs were removed from the list."
end

if todo_list.set_complete("Milk")
  puts "Milk was marked as complete."
end
puts "\n"

todo_list.print_list
todo_list.print_list('complete')
todo_list.print_list('incomplete')