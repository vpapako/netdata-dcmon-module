# shellcheck shell=bash
# no need for shebang - this file is loaded from charts.d.plugin
# SPDX-License-Identifier: GPL-3.0-or-later

# netdata
# real-time performance and health monitoring, done right!
# (C) 2016 Costa Tsaousis <costa@tsaousis.gr>
#

# if this chart is called X.chart.sh, then all functions and global variables
# must start with X_

# _update_every is a special variable - it holds the number of seconds
# between the calls of the _update() function
X_update_every=

# the priority is used to sort the charts on the dashboard
# 1 = the first chart
X_priority=

# global variables to store our collected data
# remember: they need to start with the module name
X=

# _check is called once, to find out if this chart should be enabled or not
X_check() {
	# this should return:
	#  - 0 to enable the chart
	#  - 1 to disable the chart
	return 0
}

# _create is called once, to create the charts
X_create() {
	return 0
}

# _update is called continuously, to collect the values
X_update() {
	# the first argument to this function is the microseconds since last update
	# pass this parameter to the BEGIN statement (see bellow).
	return 0
}
