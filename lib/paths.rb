require 'paths/logic'
require 'paths/arithmetic'
require 'paths/arithmetic_constant'
require 'paths/mask'
require 'paths/equalization'

module Paths
  include Paths::Logic
  include Paths::Arithmetic
  include Paths::ArithmeticConstant
  include Paths::Mask
  include Paths::Equalization
end
