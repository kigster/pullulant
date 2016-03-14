
function jpg2bmp {
  dir=
  if [ ! -z "$1" ]; then
    dir="$1/"
  fi
  for file in `ls -1 *.JPG *.jpg`; do echo converting $file...; name=$(openssl rand -hex 4 | tr 'a-z' 'A-Z'); convert $file ${dir}${name}.BMP; done
}
function hashbmp {
  for file in `ls -1 *.bmp *.BMP`; do echo converting $file...; name="$( md5 -q $file | cut -c 1-8).bmp"; mv $file $name; done
}

function utilization {
  cd ~/workspace/chef/prod
  knife ssh 'platform:smartos' 'echo $(zonename) " " $( vmstat 2 2 | tail -1 | awk "{ if (\$22 < 10) { print \"UTILIZATION: \" \$21 + \$20 \"%, [\" \$20 \"% USR]\" } }" ) " " $(hostname)  ' -x kig | grep UTILI
  cd -
}

function upgrade_admin {
  set -e
  cd ~/workspace/chef/prod
  knife joyent server resize 5e79a309-9352-e4da-95b5-ed568a7fa026 -f g3-highcpu-16-smartos
  knife joyent server resize e5e6a41d-9217-4070-9ec9-8163894e5dc6 -f g3-highcpu-16-smartos
  knife ssh 'hostname:admin*' 'sudo chef-client'
  knife ssh 'hostname:admin*' 'sudo svcadm restart unicorn'
  knife ssh 'hostname:lb0*' 'sudo chef-client'
}

function swap_example {
  example=$1
  target=$2

  if [ -z "$1" -o -z "$2" ]; then
     echo "usage: swap_example <Project> <Enclosing Library Folder>"
     echo "   eg: swap_example TwoLeds ~/arduino/RotaryKnowWithButton/examples"
     echo ""
     echo "Note that the existing projected will be moved to /tmp."
     return
  fi
  if [ ! -d "./$example" ]; then
     echo "can't find ./$example folder here"
     return
  fi

  if [ ! -d "$target" ]; then
     echo "can't find target folder [$target]"
     return
  fi

  # strip trailing slashes, if any
  target=${target%/}
  example=${example%/}

  /bin/bash -x -c "cp -rp $example/.[a-z]* $target/$example"
  /bin/bash -x -c "mkdir -p /tmp/ArduinoTrash && mv $example /tmp/ArduinoTrash/"
  /bin/bash -x -c "ln -nfs $target/$example"
}

function console {
  modem=`ls -1 /dev/cu.* | grep -vi bluetooth | tail -1`
  baud=${1:-9600}
  if [ ! -z "$modem" ]; then
    minicom -D $modem  -b $baud
  else
    echo "No USB modem device found in /dev"
  fi
}
