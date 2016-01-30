
To generate packages.txt run:

apm list --installed --bare > ~/.atom/packages.txt

To restore plugins from the packages file:

apm install  --packages-file /Users/kig/.atom/packages.txt
