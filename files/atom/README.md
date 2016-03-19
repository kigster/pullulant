
To generate packages.txt run:

apm list --installed --bare > ${HOME}/.atom/packages.txt

To restore plugins from the packages file:

apm install  --packages-file ${HOME}/.atom/packages.txt
