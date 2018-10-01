import imp

try:
  imp.find_module('numpy')
  import numpy as np
except ImportError:
  pass
