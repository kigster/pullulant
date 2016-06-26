
function jpg2bmp {
  dir=
  if [ ! -z "$1" ]; then
    dir="$1/"
  fi
  for file in `ls -1 *.JPG *.jpg`; do 
    echo converting $file...
    name=$(openssl rand -hex 4 | tr 'a-z' 'A-Z')
    convert $file ${dir}${name}.BMP
  done
}

function hashbmp {
  for file in `ls -1 *.bmp *.BMP`; do 
    echo converting $file...
    name="$( md5 -q $file | cut -c 1-8).bmp"
    mv $file $name
  done
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

# Choose the best editor to open a MarkDown file (or any other text file)
# Override array $mkd_editors[@] if your priority list is different
function mkd() {
  [[ -n "${mkd_editors}" ]] || declare -a mkd_editors=("byword" "mate" "atom" "vim")
  for editor in "${mkd_editors[@]}"; do
    if [[ -n "$(which $editor)" ]]; then 
      $editor $*
      break
    fi
  done
}

function byword() {
  [[ -n "${byword_app}" ]] || byword_app="/Applications/Byword.app"
  if [[ -d ${byword_app} ]]; then
    open $byword_app $*
  else
    vi $*
  fi
}