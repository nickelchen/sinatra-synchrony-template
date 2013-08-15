module Statistic
  module Utils
    module_function
    
    # Generates a n bytes random hex string
    # Example:
    #   random_hex(4) # => "89b8c729"
    def random_hex(n)
      SecureRandom.hex(n)
    end
  end
end