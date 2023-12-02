# bbai64_shell
Shell scripts for bbai64 sbc


to enable this script run on power on do following:
sudo chmod +x /etc/init.d/bbai64_fanpwm.sh

Next, you need to enable the script to run automatically at startup. To do this, use the following command:
sudo update-rc0.d bbai64_fanpwm.sh defaults

This will create a symlink to the script in the /etc/rc.d/ directory. The next time you reboot your system, the script will be executed automatically after root is loaded.
