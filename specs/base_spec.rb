require 'rubygems'
require 'rspec'

$:.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "base.rb"

describe BW::Base do

  it "should be able to load tool" do
    module MyTool
      include BW::Base
    end
    BW::Base.loaded_modules.should include(:MyTool)
  end

  it "should be able to call a method" do
    module MyTool
      include BW::Base

      def my_method
        return "method"
      end
    end

    BW::Base.call(:MyTool, :my_method).should == "method"
  end


  it "should manage arguments" do
    module MyTool
      include BW::Base

      def my_method(*args)
        return args.flatten
      end
    end

    BW::Base.call("MyTool", "my_method", "arg1", "arg2").should == ["arg1", "arg2"]
  end

  it "should manage more arguments" do
    module MyTool
      include BW::Base

      def my_method(arg1, arg2)
        return arg1 + arg2
      end
    end

    BW::Base.call("MyTool", "my_method", "arg1", "arg2").should == "arg1" + "arg2"
  end

  it "should handle nested modules" do
    module Tool
      include BW::Base
      module IncludedModule
        def included_method
          return "included_method_returned"
        end
      end

    end

    BW::Base.call("Tool", "IncludedModule", "included_method").should == "included_method_returned"
  end

  it "should handle help method" do
    module Tool
      include BW::Base
    end

    BW::Base.call("Tool", "help").should == "The Tool does not contain help."
  end

  it "should derive methods between modules" do
    module Tool
      include BW::Base

      def parent_method
        return "parent"
      end

      module IncludedModule
      end
    end

    BW::Base.call("Tool", "IncludedModule", "parent_method").should == "parent"
  end
end
