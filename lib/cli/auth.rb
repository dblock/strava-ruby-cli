module Strava
  module Cli
    class Auth
      def initialize(options = {})
        @access_token = options[:access_token]
        @client_id = options[:client_id]
        @client_secret = options[:client_secret]
        @scope = options[:scope]
      end

      def access_token
        @access_token ||= get_access_token
      end

      def client_id
        @client_id ||= get_client_id
      end

      def client_secret
        @client_secret ||= get_client_secret
      end

      private

      def get_access_token
        require 'webrick'

        server = WEBrick::HTTPServer.new(Port: 4242)

        trap 'INT' do
          server.shutdown
        end

        server.mount_proc '/' do |req, res|
          begin
            code = req.query['code']
            response = strava_client.oauth_token(code: code)

            res.body = %(
          <html>
            <body>
              <h3>You may close this window and return to your shell.</h3>
              <ul>
                <li>token_type: #{response.token_type}</li>
                <li>refresh_token: #{response.refresh_token}</li>
                <li>access_token: #{response.access_token}</li>
                <li>expires_at: #{response.expires_at}</li>
              </ul>
            <body>
          </html>
            )

            @access_token = response.access_token if response
          ensure
            server.shutdown
          end
        end

        redirect_url = strava_client.authorize_url(
          redirect_uri: 'http://localhost:4242/',
          response_type: 'code',
          scope: @scope
        )

        Launchy.open redirect_url do |err|
          raise "Failed to browse to #{redirect_url}: #{err}"
        end

        server.start

        @access_token
      end

      def strava_client
        @strava_client ||= Strava::OAuth::Client.new(
          client_id: client_id,
          client_secret: client_secret
        )
      end

      def get_client_id
        print 'Enter Strava client ID: '
        get_insecure
      end

      def get_client_secret
        print 'Enter Strava client secret: '
        get_secure
      end

      private

      def get_insecure
        input = $stdin.gets
        input.chomp! if input
        input
      rescue Interrupt => e
        raise e, 'ctrl + c'
      end

      def get_secure
        current_tty = `stty -g`
        system 'stty raw -echo -icanon isig' if $CHILD_STATUS.success?
        input = ''
        while (char = $stdin.getbyte) && !((char == 13) || (char == 10))
          if (char == 127) || (char == 8)
            input[-1, 1] = '' unless input.empty?
          else
            $stdout.write '*'
            input << char.chr
          end
        end
        print "\r\n"
        input
      rescue Interrupt => e
        raise e, 'ctrl + c'
      ensure
        system "stty #{current_tty}" unless current_tty.empty?
      end
    end
  end
end
