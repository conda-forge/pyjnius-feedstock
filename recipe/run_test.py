import os
import sys
# need to do config before importing jnius
import jnius_config

our_classpath = os.path.join(os.environ["CONDA_PREFIX"], "share", "pyjnius", "*")
print(our_classpath)
jnius_config.set_classpath(our_classpath)

import jnius
from jnius import autoclass

AL = autoclass( 'java.util.ArrayList' )
al = AL()
hw = 'Hello World!'
for c in hw:
	al.add( c )
print( al.toString() )

if al.size() != len( hw ):
	raise RuntimeError('Length of ArrayList and python string are not the same!')

for idx, c in enumerate( hw ):
	if c != al.get( idx ):
		raise RuntimeError('Character mismatch!')

System = autoclass('java.lang.System')
print(System.getProperty('java.version'))

# need to make sure we run pytest in the same python session
# so that the effect of jnius_config persists
import pytest
sys.exit(pytest.main(["-v", "tests"]))
