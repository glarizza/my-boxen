Puppet::Parser::Functions.newfunction(:integer, :type => :rvalue) do |args|
  Integer(args.first)
end
