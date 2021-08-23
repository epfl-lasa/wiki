from catkin_pkg.python_setup import generate_distutils_setup
from distutils.core import setup

d = generate_distutils_setup(
    packages=['python_package_template'],
    package_dir={'': 'src'}
)
setup(**d)
