module Sinatra
  class Metrics
    class LtsvFormatter
      def call(severity, datetime, progname, msg)
        "time:#{datetime.iso8601}\t#{format_msg(msg)}\n"
      end

      private

      def format_msg(msg)
        msg.map {|k, v| "#{k}:#{v}" }.join("\t")
      end
    end
  end
end
