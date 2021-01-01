from distutils import setup

setup(
	# Application name:
	name="rduty",

	# Version
	version="0.1",

	author="Gabriele Giorgetti"
	author_email="g.giorgetti@gmail.com"

	# Packages
	packages=["rduty"],

	# Include additional files into the package
	include_package_data=True,
	
	# Details
	url="http://pypi.python.org/pypi/MyApplication_v010/",

	#
	# license="LICENSE.txt",
	description="Useful towel-related stuff.",

	# long_description=open("README.txt").read(),

	# Dependent packages (distributions)
	install_requires=[
        "paramiko",
    ],
)

