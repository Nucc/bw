Bonanza Workspace
=================

Bonanza Workspace is a tool for calling methods in Ruby module directly from command line.

This gem is only a framework, you should extend it with your own business logic.

<b>Note</b>: The tool is currently under hard development.

Examples
--------

<ol>
<li>Calling a simple method</li>

<pre>
module Make
  include BW::Base

  def snapshot
    puts "Here is the snapshot logic"
  end
end
</pre>

<pre>
$ bw make snapshot
</pre>

<li>Calling method with parameters</li>

<pre>
module Calculator
  include BW::Base

  def sum(arg1, arg2)
    return arg1 + arg2
  end
end
</pre>

<pre>
$ bw Calculator sum 1 2
</pre>

<li>Nested modules</li>

<pre>
module Create
  include BW::Base
  module Release
    def snapshot(product_name)
      puts "Creating snapshot is started..."
    end
  end
end
</pre>

<pre>
$ bw Create Release snapshot check.it
</pre>

<li>Derivation</li>

<pre>
module Create
  include BW::Base

  def version
    "1.0"
  end

  module Release
  end
end
</pre>

<pre>
$ bw Create Release version
=> 1.0
</pre>
</ol>
Installation
------------

Add this line to your application's Gemfile:

<pre>
gem 'bw'
</pre>

And then execute:

<pre>
$ bundle
</pre>

Or install it yourself as:

<pre>
$ gem install bw
</pre>

And then add these lines to your code:

<pre>
require "rubygems"
require "bw"
</pre>
