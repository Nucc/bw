module BW
  module Base

    module Interface

      def help
        "The #{self.class.to_s} does not contain help."
      end
    end

    def self.loaded_modules
      @modules
    end

    def self.included(base)
      @modules ||= {}
      @modules[base.to_s.to_sym] = base
    end

    def self.call(*args)
      name = @modules[args.shift.to_sym]

      @temp_class = Class.new do
        include Interface
        include Kernel.const_get(name.to_s)
        def self.to_s
          @name
        end
        def self.name=(name)
          @name = name
        end
      end
      @temp_class.name = name

      while not args.empty? do
        begin
          name = Kernel.const_get(name.to_s).const_get(args[0].to_s)
          @temp_class = Class.new(@temp_class) do
            include name
          end
          @temp_class.name = name
          args.shift
        rescue NameError => e
          break
        end
      end

      return @temp_class.new.method(args.shift).call(*args)
    end
  end
end
