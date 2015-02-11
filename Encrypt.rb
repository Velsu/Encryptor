#Project complete

class Encryptor

	def initialize
	end

#Creates a cipher for ROT system
	def cipher(rotation)
	ary = (' '..'z').to_a
	srary = (' '..'z').to_a.rotate(rotation)
	args = ary.zip(srary)
	Hash[*args.flatten]

	end

	def encrypt(letter, rotation)
		ciph = cipher(rotation)
		sentence = letter.split("")
		sentence.map{ |l| ciph[l] }.join
	end

	def decrypt(letter, rotation)
		ciph = cipher(-rotation)
		sentence = letter.split("")
		sentence.map{ |l| ciph[l] }.join
	end

	def encrypt_file(filename, rotation)
		input = File.open(filename, "r")
		fdd = encrypt(input.read, rotation)
		ft = File.open(filename + ".encrypted", "w")
		ft.puts(fdd) ; ft.close
	end

	def decrypt_file(filename, rotation)
		input = File.open(filename, "r")
		fdd = decrypt(input.read + "\n", rotation)
		ft = File.open(filename + ".decrypted", "w")
		ft.puts(fdd) ; ft.close
	end

	def supported_characters
		(' '..'z').to_a
	end

	def crack(message)

		out = File.open("cracking.txt", "w")
		supported_characters.count.times.collect do |attempt|
			out.puts(decrypt(message, attempt))
		end
		out.close
	end
end
