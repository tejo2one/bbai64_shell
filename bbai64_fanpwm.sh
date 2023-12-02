#! /bin/bash
while true; do
    # read temperature from thermal zones(0~4)
    temp1 = $(cat /sys/devices/virtual/thermal/thermal_zone0/temp)
    temp2 = $(cat /sys/devices/virtual/thermal/thermal_zone1/temp)
    temp3 = $(cat /sys/devices/virtual/thermal/thermal_zone2/temp)
    temp4 = $(cat /sys/devices/virtual/thermal/thermal_zone3/temp)
    temp5 = $(cat /sys/devices/virtual/thermal/thermal_zone4/temp)

    if [  ( $temp1 -le 40 ) -a ( $temp2 -le 40 ) -a ( $temp3 -le 40 ) -a ( $temp4 -le 40 ) -a ( $temp5 -le 40 ) ]; then
        pwm_duty = 5
    elif [  ( $temp1 -le 50 ) -a ( $temp2 -le 50 ) -a ( $temp3 -le 50 ) -a ( $temp4 -le 50 ) -a ( $temp5 -le 50 ) ]; then
        pwm_duty = 10    
    elif [  ( $temp1 -le 60 ) -a ( $temp2 -le 60 ) -a ( $temp3 -le 60 ) -a ( $temp4 -le 60 ) -a ( $temp5 -le 60 ) ]; then
        pwm_duty = 30    
    elif [  ( $temp1 -le 70 ) -a ( $temp2 -le 70 ) -a ( $temp3 -le 70 ) -a ( $temp4 -le 70 ) -a ( $temp5 -le 70 ) ]; then
        pwm_duty = 50    
    elif [  ( $temp1 -le 75 ) -a ( $temp2 -le 75 ) -a ( $temp3 -le 75 ) -a ( $temp4 -le 75 ) -a ( $temp5 -le 75 ) ]; then
        pwm_duty = 60    
    elif [  ( $temp1 -le 80 ) -a ( $temp2 -le 80 ) -a ( $temp3 -le 80 ) -a ( $temp4 -le 80 ) -a ( $temp5 -le 80 ) ]; then
        pwm_duty = 70    
    else
        pwm_duty = 90
    fi

    #write PWM duty cycle to device

    echo 0 > /sys/class/pwm/pwmchip0/pwm1/enable    #disable pwm before write
    echo 100 > /sys/class/pwm/pwmchip0/pwm1/period    #disable pwm before write
    echo $pwm_duty > /sys/class/pwm/pwmchip0/pwm1/duty_cycle    #disable pwm before write
    echo 1 > /sys/class/pwm/pwmchip0/pwm1/enable    #disable pwm before write

    #sleep for 1 second
    sleep 1
done
