class Channel
  def self.host
    @host ||= Redis.new
  end

  def self.publish(channel_name, message)
    host.publish(channel_name, message.to_json)
  end
end