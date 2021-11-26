# class SecretFile
#   attr_reader :data

#   def initialize(secret_data)
#     @data = secret_data
#   end
# end

class SecretFile
  def initialize(secret_data, security_log)
    @data = secret_data
    @log = security_log
  end

  def data
    @data
    @log.create_log_entry
  end
end

class SecurityLogger
  def create_log_entry
    # ... implementation omitted ...
  end
end