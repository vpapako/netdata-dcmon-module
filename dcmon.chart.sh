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
dcmon_update_every=5

# the priority is used to sort the charts on the dashboard
# 1 = the first chart
dcmon_priority=1

# global variables to store our collected data
# remember: they need to start with the module name

# HVAC Board (watts)
dcmon_RphaseWatts=
dcmon_SphaseWatts=
dcmon_TphaseWatts=
dcmon_RphaseKiloWattHours=
dcmon_SphaseKiloWattHours=
dcmon_TphaseKiloWattHours=

# HVAC Board (amps)
dcmon_RphaseIrms=
dcmon_SphaseIrms=
dcmon_TphaseIrms=

# Board "A" Board (watts)
dcmon_RphaseWattsA=
dcmon_SphaseWattsA=
dcmon_TphaseWattsA=
dcmon_RphaseKiloWattHoursA=
dcmon_SphaseKiloWattHoursA=
dcmon_TphaseKiloWattHoursA=

# Board "A" (amps)
dcmon_RphaseIrmsA=
dcmon_SphaseIrmsA=
dcmon_TphaseIrmsA=

# Board "B" Board (watts)
dcmon_RphaseWattsB=
dcmon_SphaseWattsB=
dcmon_TphaseWattsB=
dcmon_RphaseKiloWattHoursB=
dcmon_SphaseKiloWattHoursB=
dcmon_TphaseKiloWattHoursB=

# Board "B" (amps)
dcmon_RphaseIrmsB=
dcmon_SphaseIrmsb=
dcmon_TphaseIrmsB=

# _check is called once, to find out if this chart should be enabled or not
dcmon_check() {
	# this should return:
	#  - 0 to enable the chart
	#  - 1 to disable the chart

	# check if jq for accessing json data is available
        require_cmd jq || return 1
        return 0
}

# _create is called once, to create the charts
dcmon_create() {
	return 0
}

# _update is called continuously, to collect the values
dcmon_update() {
	# the first argument to this function is the microseconds since last update
	# pass this parameter to the BEGIN statement (see bellow).
	return 0
}
