require "test_helper"

module Hector
  class SecretChannelsTest < IntegrationTest
    test :"whois includes the correct channels" do
      authenticated_connections(:join => "#channel1") do |c1, c2|
        c1.receive_line "JOIN #channel2"
        c2.receive_line "JOIN #channel2"
        c1.receive_line "JOIN #channel3"
        c2.receive_line "JOIN #channel4"
        
        assert_channel_users "#channel1", c1, c2
        assert_channel_users "#channel2", c1, c2
        assert_channel_users "#channel3", c1
        assert_channel_users "#channel4", c2
        
        c1.receive_line "WHOIS user2"
        assert_sent_to c1, /^319.*#channel1/
        assert_sent_to c1, /^319.*#channel2/
        assert_not_sent_to c1, /^319.*#channel4/
        c2.receive_line "WHOIS user1"
        assert_sent_to c2, /^319.*#channel1/
        assert_sent_to c2, /^319.*#channel2/
        assert_not_sent_to c2, /^319.*#channel3/
      end
    end
    
    def assert_channel_users(channel, *connections)
      channel = Channel.find(channel) unless channel.is_a?(Channel)
      sessions = connections.flatten.map { |c| c.session }
      assert channel.user_sessions.all? { |s| sessions.include?(s) }
    end
  end
end
