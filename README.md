# Interface Monitor

This Bash script monitors a specified network interface and ensures that certain routes are present when the interface is up. It continuously checks the connectivity of the interface and adds missing routes if necessary.

## Prerequisites

- Linux operating system
- `ping` command
- `ip` command

## Installation

1. Clone the repository or download the `monitor_interface.sh` script.

```bash
git clone https://github.com/inabakumori/network-interface-monitor.git
```

2. Make the script executable.

```bash
chmod +x monitor_interface.sh
```

## Configuration

1. Open the `monitor_interface.sh` script in a text editor.

2. Modify the following variables according to your requirements:
   - `MONITOR_IFACE`: Specify the network interface you want to monitor (e.g., "enp4s0").
   - `ROUTES`: Add or remove routes that should be present when the interface is up. Each route should be in the format "destination via gateway dev interface".
   - `TEST_IP`: Set the IP address or domain to check internet connectivity.
   - `DEFAULT_GATEWAY`: Set the default gateway IP address.

3. Save the changes.

## Usage

1. Run the script with root privileges.

```bash
sudo ./monitor_interface.sh
```

The script will start monitoring the specified interface and add missing routes if necessary. It will display the status of the interface ("up" or "down") and log any route additions with timestamps.

2. To run the script automatically on system startup, add it to your crontab.

```bash
sudo crontab -e
```

Add the following line to the crontab file:

```
@reboot /usr/bin/screen -dmS monitor_interface /path/to/monitor_interface.sh
```

Replace `/path/to/monitor_interface.sh` with the actual path to the script.

3. Save the crontab file and exit the editor.

The script will now run automatically in the background whenever the system starts up.

## Testing

This script has been successfully tested on Linux.

## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [inabakumori](https://github.com/inabakumori) for creating the script.

If you have any questions or issues, please open an issue on the [GitHub repository](https://github.com/inabakumori/interface-monitor/issues).
