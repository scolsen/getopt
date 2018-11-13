@[Link("getopt")]
lib LibGetopt
  $opterr : LibC::Int
  $optind : LibC::Int
  $optopt : LibC::Int
  $optarg : LibC::Char*
  $optreset : LibC::Int


  enum OptionType 
    no_argument = 0,
    required_argument = 1,
    optional_argument = 2
  end
    
  struct Option
    name : LibC::Char*,
    has_arg : OptionType
    flag : LibC::Int*
    val : LibC::Int
  end

  fun getopt_long(argc : LibC::Int, argv : LibC::Char**, shortopts : LibC::Char*, longopts : Option*, out optdex) : LibC::Int
  fun getopt_long_only(argc : LibC::Int, argv : LibC::Char**, shortopts : LibC::Char*, longopts : Option*, out optdex) : LibC::Int
  fun getopt(argc : LibC::Int, argv : LibC::Char**, options : LibC::Char*) : LibC::Int
end

module Getopt
OPTDEX = 0

def short(options : String)
  LibGetopt.getopt(ARGV.size, ARGV, options)
end

def long(shortopts : String, longopts : Array(LibGetopt::Option))
  LibGetopt.getopt_long(ARGV.size, ARGV, shortopts, longopts, OPTDEX)
end

def long_only(shortopts : String, longopts : Array(LibGetopt::Option))
  LibGetopt.getopt_long(ARGV.size, ARGV, shortopts, longopts, OPTDEX)
end

end
