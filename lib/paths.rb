require 'paths/logic'
require 'paths/arithmetic'
require 'paths/arithmetic_constant'
require 'paths/mask'

module Paths
  include Paths::Logic
  include Paths::Arithmetic
  include Paths::ArithmeticConstant
  include Paths::Mask
end