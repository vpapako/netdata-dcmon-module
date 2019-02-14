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
dcmon_update_every=1

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


dcmon_get() {
        # do all the work to collect / calculate the values
        # for each dimension
        #
        # Remember:
        # 1. KEEP IT SIMPLE AND SHORT
        # 2. AVOID FORKS (avoid piping commands)
        # 3. AVOID CALLING TOO MANY EXTERNAL PROGRAMS
        # 4. USE LOCAL VARIABLES (global variables may overlap with other modules)

	# HVAC Board
	dcmon_RphaseWatts=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [0] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
	dcmon_SphaseWatts=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [1] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
	dcmon_TphaseWatts=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [2] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
	dcmon_RphaseIrms=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [3] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
	dcmon_SphaseIrms=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [4] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
	dcmon_TphaseIrms=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [5] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
	dcmon_RphaseKiloWattHours=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [6] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
	dcmon_SphaseKiloWattHours=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [7] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
	dcmon_TphaseKiloWattHours=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [8] .value' | sed -e 's/"//g') | sed -e 's/\.//g')

	# Board "A"
	dcmon_RphaseWattsA=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [18] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
	dcmon_SphaseWattsA=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [19] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
	dcmon_TphaseWattsA=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [20] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
	dcmon_RphaseIrmsA=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [12] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
	dcmon_SphaseIrmsA=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [13] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
	dcmon_TphaseIrmsA=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [14] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
	dcmon_RphaseKiloWattHoursA=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [21] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
	dcmon_SphaseKiloWattHoursA=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [22] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
	dcmon_TphaseKiloWattHoursA=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [23] .value' | sed -e 's/"//g') | sed -e 's/\.//g')

        # Board "B"
        dcmon_RphaseWattsB=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [15] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
        dcmon_SphaseWattsB=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [16] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
        dcmon_TphaseWattsB=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [17] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
        dcmon_RphaseIrmsB=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [9] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
        dcmon_SphaseIrmsB=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [10] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
        dcmon_TphaseIrmsB=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [11] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
        dcmon_RphaseKiloWattHoursB=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [24] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
        dcmon_SphaseKiloWattHoursB=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [25] .value' | sed -e 's/"//g') | sed -e 's/\.//g')
        dcmon_TphaseKiloWattHoursB=$(printf '%.2f' $(curl -s "http://dcmon.datacenter.uoc.gr/feed/list.json?userid=1" | jq '. [26] .value' | sed -e 's/"//g') | sed -e 's/\.//g')


        # this should return:
        #  - 0 to send the data to netdata
        #  - 1 to report a failure to collect the data

        return 0
}

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
	# create the HVAC Board (watts) chart with 3 dimensions
	cat <<EOF
CHART dcmon.hvac_board_total_kwh '' "Total energy consumption of HVAC Board" "Kwh" "HVAC Board" "board_hvac_sum" $((dcmon_priority + 1)) $dcmon_update_every
DIMENSION Rphase '' absolute 1 100
DIMENSION Sphase '' absolute 1 100
DIMENSION Tphase '' absolute 1 100
CHART dcmon.hvac_board_watts '' "Energy consumption of HVAC Board" "watts" "HVAC Board" "board_hvac" $((dcmon_priority)) $dcmon_update_every
DIMENSION Rphase '' absolute 1 100
DIMENSION Sphase '' absolute 1 100
DIMENSION Tphase '' absolute 1 100
CHART dcmon.hvac_board_irms '' "Energy consumption of HVAC Board" "amps" "HVAC Board" "board_hvac" $((dcmon_priority + 2)) $dcmon_update_every
DIMENSION Rphase '' absolute 1 100
DIMENSION Sphase '' absolute 1 100
DIMENSION Tphase '' absolute 1 100
CHART dcmon.board_a_total_kwh '' "Total energy consumption of Board A" "Kwh" "Board A" "board_a_sum" $((dcmon_priority + 4)) $dcmon_update_every
DIMENSION Rphase '' absolute 1 100
DIMENSION Sphase '' absolute 1 100
DIMENSION Tphase '' absolute 1 100
CHART dcmon.board_a_watts '' "Energy consumption of Board A" "watts" "Board A" "board_a" $((dcmon_priority + 3)) $dcmon_update_every
DIMENSION Rphase '' absolute 1 100
DIMENSION Sphase '' absolute 1 100
DIMENSION Tphase '' absolute 1 100
CHART dcmon.board_a_irms '' "Energy consumption of Board A" "amps" "Board A" "board_a" $((dcmon_priority + 5)) $dcmon_update_every
DIMENSION Rphase '' absolute 1 100
DIMENSION Sphase '' absolute 1 100
DIMENSION Tphase '' absolute 1 100
CHART dcmon.board_b_total_kwh '' "Total energy consumption of Board B" "Kwh" "Board B" "board_b_sum" $((dcmon_priority + 7)) $dcmon_update_every
DIMENSION Rphase '' absolute 1 100
DIMENSION Sphase '' absolute 1 100
DIMENSION Tphase '' absolute 1 100
CHART dcmon.board_b_watts '' "Energy consumption of Board B" "watts" "Board B" "board_b" $((dcmon_priority + 6)) $dcmon_update_every
DIMENSION Rphase '' absolute 1 100
DIMENSION Sphase '' absolute 1 100
DIMENSION Tphase '' absolute 1 100
CHART dcmon.board_b_irms '' "Energy consumption of Board B" "amps" "Board B" "board_b" $((dcmon_priority + 8)) $dcmon_update_every
DIMENSION Rphase '' absolute 1 100
DIMENSION Sphase '' absolute 1 100
DIMENSION Tphase '' absolute 1 100
EOF

	return 0
}

# _update is called continuously, to collect the values
dcmon_update() {
	# the first argument to this function is the microseconds since last update
	# pass this parameter to the BEGIN statement (see bellow).

	dcmon_get || return 1

	# write the result of the work.
        cat <<VALUESEOF
BEGIN dcmon.hvac_board_total_kwh $1
SET Rphase = $dcmon_RphaseKiloWattHours
SET Sphase = $dcmon_SphaseKiloWattHours
SET Tphase = $dcmon_TphaseKiloWattHours
END
BEGIN dcmon.hvac_board_watts $1
SET Rphase = $dcmon_RphaseWatts
SET Sphase = $dcmon_SphaseWatts
SET Tphase = $dcmon_TphaseWatts
END
BEGIN dcmon.hvac_board_irms $1
SET Rphase = $dcmon_RphaseIrms
SET Sphase = $dcmon_SphaseIrms
SET Tphase = $dcmon_TphaseIrms
END
BEGIN dcmon.board_a_total_kwh $1
SET Rphase = $dcmon_RphaseKiloWattHoursA
SET Sphase = $dcmon_SphaseKiloWattHoursA
SET Tphase = $dcmon_TphaseKiloWattHoursA
END
BEGIN dcmon.board_a_watts $1
SET Rphase = $dcmon_RphaseWattsA
SET Sphase = $dcmon_SphaseWattsA
SET Tphase = $dcmon_TphaseWattsA
END
BEGIN dcmon.board_a_irms $1
SET Rphase = $dcmon_RphaseIrmsA
SET Sphase = $dcmon_SphaseIrmsA
SET Tphase = $dcmon_TphaseIrmsA
END
BEGIN dcmon.board_b_total_kwh $1
SET Rphase = $dcmon_RphaseKiloWattHoursB
SET Sphase = $dcmon_SphaseKiloWattHoursB
SET Tphase = $dcmon_TphaseKiloWattHoursB
END
BEGIN dcmon.board_b_watts $1
SET Rphase = $dcmon_RphaseWattsB
SET Sphase = $dcmon_SphaseWattsB
SET Tphase = $dcmon_TphaseWattsB
END
BEGIN dcmon.board_b_irms $1
SET Rphase = $dcmon_RphaseIrmsB
SET Sphase = $dcmon_SphaseIrmsB
SET Tphase = $dcmon_TphaseIrmsB
END

VALUESEOF
	return 0
}
