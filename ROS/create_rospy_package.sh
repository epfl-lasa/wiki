#!/bin/bash
helpFunction()
{
   echo ""
   echo "Usage: $0 -n package_name -p path -m yes/no [-d dependency1] [-d dependency2] [-d ...]"
   echo -e "\t-n Name of the package"
   echo -e "\t-p Path of the catkin workspace src directory where the package should be created (e.g. ~/catkin_ws/src)"
   echo -e "\t-m (yes or no) Minimal package.xml and CMakeLists.txt (this will delete all commented lines!)"
   echo -e "\t-d dependencies (optional, one dependency per -d tag)"
   exit 1 # Exit script after printing help
}

while getopts "n:p:m:d:" opt
do
   case "$opt" in
      n ) package_name="$OPTARG" ;;
      p ) path="$OPTARG" ;;
      m ) minimal="$OPTARG" ;;
      d ) dependencies+=("$OPTARG") ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$package_name" ] || [ -z "$path" ] || [ -z "$minimal" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct
cd "$path" || exit 1
if [ ${#dependencies[@]} = 0 ]
then
  catkin_create_pkg "$package_name" rospy
else
  catkin_create_pkg "$package_name" rospy "${dependencies[@]}"
fi

cd "$package_name" || exit 1

echo "from distutils.core import setup
from catkin_pkg.python_setup import generate_distutils_setup

d = generate_distutils_setup(
    packages=['$package_name'],
    package_dir={'': 'src'}
)
setup(**d)" > setup.py
echo "Created file $package_name/setup.py"

sed -i 's/# catkin_python_setup()/catkin_python_setup()/' CMakeLists.txt
if [ "$minimal" = "yes" ]
then
  (sed '/^  <!/d' package.xml > package2.xml && mv package2.xml package.xml) || rm package2.xml
  (sed '/^$/{:a;N;s/\n$//;ta}' package.xml > package2.xml && mv package2.xml package.xml) || rm package2.xml

  (sed '/^##/d' CMakeLists.txt > CMakeLists2.txt && mv CMakeLists2.txt  CMakeLists.txt ) || rm CMakeLists2.txt
  (sed '/^$/{:a;N;s/\n$//;ta}' CMakeLists.txt > CMakeLists2.txt && mv CMakeLists2.txt  CMakeLists.txt ) || rm CMakeLists2.txt
  sed -i '$ d' CMakeLists.txt
fi

cd src && mkdir "$package_name"
cd "$package_name" && touch __init__.py
echo "Created source folder and file $package_name/src/$package_name/__init__.py"
