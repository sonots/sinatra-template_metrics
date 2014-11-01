require 'sinatra/template_metrics/ltsv_formatter'
require 'logger'

module Sinatra
  class TemplateMetrics
    def self.logger=(logger)
      @logger = logger
    end

    def self.logger
      @logger ||= Logger.new(STDOUT).tap {|log|
        log.formatter = ::Sinatra::Metrics::LtsvFormatter.new
      }
    end

    def self.add_tracer(method)
      klass = ::Sinatra::Templates
      unless klass.method_defined?("#{method}_without_metrics")
        klass.__send__(:alias_method, "#{method}_without_metrics", method)
        klass.__send__(:define_method, "#{method}_with_metrics") do |template, options = {}, locals = {}, &block|
        ::Sinatra::TemplateMetrics.measure_time(template, options[:layout]) do
          send("#{method}_without_metrics", template, options, locals, &block)
        end
        end
        klass.__send__(:alias_method, method, "#{method}_with_metrics")
      end
    end

    def self.measure_time(template, layout, &block)
      start = Time.now
      ret = yield
      elapsed = Time.now - start
      logger = Sinatra::TemplateMetrics.logger
      logger.info({ template: template, layout: layout, elapsed: elapsed.to_f })
      ret
    end
  end
end

# open class
module Sinatra
  module Templates
    # add_tracer :render was not good because it is called for layout also
    ::Sinatra::TemplateMetrics.add_tracer :erb
    ::Sinatra::TemplateMetrics.add_tracer :erubis
    ::Sinatra::TemplateMetrics.add_tracer :haml
    ::Sinatra::TemplateMetrics.add_tracer :sass
    ::Sinatra::TemplateMetrics.add_tracer :scss
    ::Sinatra::TemplateMetrics.add_tracer :less
    ::Sinatra::TemplateMetrics.add_tracer :stylus
    ::Sinatra::TemplateMetrics.add_tracer :less
    ::Sinatra::TemplateMetrics.add_tracer :builder
    ::Sinatra::TemplateMetrics.add_tracer :liquid
    ::Sinatra::TemplateMetrics.add_tracer :markdown
    ::Sinatra::TemplateMetrics.add_tracer :textile
    ::Sinatra::TemplateMetrics.add_tracer :rdoc
    ::Sinatra::TemplateMetrics.add_tracer :slim
  end
end

