@[Link("C")]
lib LibGetopt
  $opterr : LibC::Int
  $optind : LibC::Int
  $optopt : LibC::Int
  $optarg : LibC::Char*
  $optreset : LibC::Int


  enum OptionType 
    NoArgument = 0,
    RequiredArgument = 1,
    OptionalArgument = 2
  end
    
  struct Option
    name : LibC::Char*
    has_arg : OptionType
    flag : LibC::Int*
    val : LibC::Int
  end

  fun getopt_long(argc : LibC::Int, argv : LibC::Char**, shortopts : LibC::Char*, longopts : Option*, optdex : LibC::Int*) : LibC::Int
  fun getopt_long_only(argc : LibC::Int, argv : LibC::Char**, shortopts : LibC::Char*, longopts : Option*, optdex : LibC::Int*) : LibC::Int
  fun getopt(argc : LibC::Int, argv : LibC::Char**, options : LibC::Char*) : LibC::Int
end

module Getopt
extend self
OPTDEX = 0
ARGS = ARGV.map(&.to_unsafe)


def short(options : String)
  LibGetopt.getopt(ARGV.size, ARGS, options)
end

def long(shortopts : String, longopts : Array(LibGetopt::Option))
  LibGetopt.getopt_long(ARGV.size, ARGV, shortopts, longopts, OPTDEX)
end

def long_only(shortopts : String, longopts : Array(LibGetopt::Option))
  LibGetopt.getopt_long(ARGV.size, ARGV, shortopts, longopts, OPTDEX)
end

end
