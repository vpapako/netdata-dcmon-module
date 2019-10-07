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
environmental_update_every=900

# the priority is used to sort the charts on the dashboard
# 1 = the first chart
environmental_priority=10

# global variables to store our collected data
# remember: they need to start with the module name

# Measurements
environmental_temperature=
environmental_humidity=

environmental_get() {
        # do all the work to collect / calculate the values
        # for each dimension
        #
        # Remember:
        # 1. KEEP IT SIMPLE AND SHORT
        # 2. AVOID FORKS (avoid piping commands)
        # 3. AVOID CALLING TOO MANY EXTERNAL PROGRAMS
        # 4. USE LOCAL VARIABLES (global variables may overlap with other modules)
	
	temperature_response=$(curl -s "http://smartcity.heraklion.gr:3000/ambient_temperature?device_id=eq.120&order=created_at.desc&limit=1")
	humidity_response=$(curl -s "http://smartcity.heraklion.gr:3000/ambient_humidity?device_id=eq.120&order=created_at.desc&limit=1")	

	# 
	environmental_temperature=$($(echo $temperature_response | jq '. [0] .value'))
	environmental_humidity=$($(echo $humidity_response | jq '. [0] .value'))

        # this should return:
        #  - 0 to send the data to netdata
        #  - 1 to report a failure to collect the data

        return 0
}

# _check is called once, to find out if this chart should be enabled or not
environmental_check() {
	# this should return:
	#  - 0 to enable the chart
	#  - 1 to disable the chart

	# check if jq for accessing json data is available
        require_cmd jq || return 1
        return 0
}

# _create is called once, to create the charts
environmental_create() {
	# create the HVAC Board (watts) chart with 3 dimensions
	cat <<EOF
CHART environmental.temperature_C '' "Temperature" "C" "Environmental" "environmental" $((environmental_priority)) $environmental_update_every
DIMENSION temperature '' absolute 1 100
CHART environmental.humidity_RH '' "Humidity" "RH%" "Environmental" "environmental" $((environmental_priority + 1)) $environmental_update_every
DIMENSION humidity '' absolute 1 100
EOF

	return 0
}

# _update is called continuously, to collect the values
environmental_update() {
	# the first argument to this function is the microseconds since last update
	# pass this parameter to the BEGIN statement (see bellow).

	environmental_get || return 1

	# write the result of the work.
        cat <<VALUESEOF
BEGIN environmental.temperature_C $1
SET temperature = $environmental_temperature
END
BEGIN environmental.humidity_RH $1
SET humidity = $environmental_humidity
END

VALUESEOF
	return 0
}
