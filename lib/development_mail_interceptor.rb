class DevelopmentMailInterceptor
  def self.delivering_email(message)
    # message.subject = "[#{message.to}] #{message.subject}"
    message.to = "richard.p.kuo@gmail.com"
  end
end