module Hector
  module Commands
    module Whois
      def respond_to_whois_for(destination, session)
        respond_with("301", session.nickname, :text => session.away_message) if session.away?
        respond_with("311", destination, session.nickname, session.whois)
        unless channels.empty? || session.channels.empty?
          mutual_channels = channels & session.channels
          respond_with("319", destination, session.nickname, :text => mutual_channels.map { |c| c.name }.join(" "))
        end
        respond_with("312", destination, session.nickname, Hector.server_name, :text => "Hector")
        respond_with("317", destination, session.nickname, session.seconds_idle, session.created_at, :text => "seconds idle, signon time")
      end
    end
  end
end
