path="uptime.txt"
((epoch_Minutes=$(date +%s)/60))

if [[ $(pgrep -x httpd) ]]; then
  if [ ! -f $path ]; then
    #write start epoch
    #write 1 
    echo "startMinute=$epoch_Minutes" > $path
    echo "upMinutes=0" >> $path
    echo "currentMinute=$epoch_Minutes" >> $path
    #ifno gobot then exit, no point starting uptime without gobot started
  else
    upMinutes=$(grep upMinutes $path | cut -d "=" -f2 )
    ((upMinutes=$upMinutes+1))
    echo $upMinutes
    sed -i "s/upMinutes.*/upMinutes=$upMinutes/" $path
    sed -i "s/currentMinute.*/currentMinute=$epoch_Minutes/" $path
  fi
else
  sed -i "s/currentMinute.*/currentMinute=$epoch_Minutes/" $path
fi
