# Linux Networking Commands for DevOps

## 1. Basic Connectivity & Troubleshooting

- **`ping`**: Tests connectivity to a host (e.g., `ping google.com`).
- **`traceroute` / `tracepath`**: Tracks the path packets take to reach a destination.
- **`mtr`**: A real-time combination of ping and traceroute.
- **`telnet`**: Checks if a specific port is reachable (e.g., `telnet localhost 80`).
- **`nc` (netcat)**: The "Swiss army knife" for reading/writing data across network connections.

## 2. Interface & IP Information

- **`ifconfig`**: Displays network interface details (older tool).
- **`ip addr`**: Modern replacement for `ifconfig` to view and manage IP addresses.
- **`hostname`**: Displays the system's host name. Use `hostname -i` for the IP address.
- **`iwconfig`**: Dedicated to configuring wireless network interfaces.
- **`ifplugstatus`**: Checks the link status of a local Ethernet interface.

## 3. Connection & Port Monitoring

- **`netstat`**: Shows network connections, routing tables, and interface statistics.
  - _Pro tip:_ `netstat -tulpn` shows all listening ports.
- **`ss`**: A faster version of `netstat` for checking socket statistics.
- **`arp`**: Manages the system's Address Resolution Protocol (ARP) cache.

## 4. DNS & Domain Discovery

- **`nslookup`**: Queries DNS to find the IP address of a domain name.
- **`dig`**: A more detailed DNS lookup tool (Domain Information Groper).
- **`whois`**: Provides registration information for a domain or IP block.

## 5. Advanced Analysis & Routing

- **`route`**: Shows or manipulates the IP routing table.
- **`nmap`**: Powerful tool for network exploration and security auditing (port scanning).
- **`wget` / `curl`**: Command-line tools for downloading files or testing web endpoints/APIs.
