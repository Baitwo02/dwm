print_info(){
    uname -r | sed -r "s/(.*)-arch.*/\1/"
}

print_disk(){
    df -hl | grep nvme0n1p3 | sed -r "s/\/dev\/nvme0n1p3 *(.*?)G *(.*?)G *.*G.*/\2\/\1/"
}

print_mem(){
    free -m | grep Mem | sed -r "s/Mem: *([0-9]*) *([0-9]*) *.*/\2\/\1/"
}

print_nvidia(){
    nvidia-smi | grep Default | sed -r "s/\|.*\| *(.*?)MiB *\/ *(.*?)MiB *.*/\1\/\2/"
}

print_battery() {
    CHARGE_STATUS=$(acpi | sed -r "s/.*: (.*?),.*%.*/\1/")
    BATTERY=$(acpi | sed -r "s/.*, (.*)%.*/\1/")
    if [ "$CHARGE_STATUS" = "Discharging" ]; then
        printf "$BATTERY"
    else
        printf "$BATTERY"
    fi
}

print_light(){
    light
}

print_volume(){
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
	VOLSTAT=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\] \[(.*)\]/\2/")
    if [ "$VOLSTAT" = "off" ]; then
        printf "$VOL"
    else
        printf "$VOL"
    fi
}

print_date(){
    date '+%Y-%m-%d %H:%M:%S'
}

xsetroot -name "|arch-$(print_info)|$(print_disk)G|﬙$(print_mem)|$(print_nvidia)|$(print_battery)%|$(print_light)%|$(print_volume)%|$(print_date) "

exit 0
