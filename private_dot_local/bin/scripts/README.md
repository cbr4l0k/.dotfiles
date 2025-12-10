# Public Scripts

Utility scripts for daily workflow automation and system management.

## Scripts

**cryptohack** - Launch Podman container for cryptography practice labs with Jupyter notebook interface on port 8888.

**cur** - Manage `~/current` symlink to active project. Commands: `cu` to set, `cur show` to display, `cur go` to navigate, `cur force` to replace.

**gsmr** - Git Save Multiple Repositories. Auto-commits and pushes changes in configured repositories. Configuration file: `~/.config/gsmr/gsmr.conf`.

**itmo_guess** - Send WiFi authentication request to ITMO university network. Usage: `itmo_guess <phone_number>`.

**matt** - Move files to Obsidian attachments folder with filename sanitization. Requires `$OBSIDIAN_ATTACHMENTS` environment variable.

**mil** - Display current public IP address and country using ifconfig.co.

**mkcd** - Create directory and navigate into it. Usage: `mkcd <directory_name>`.

**ND** - Sybil Document Generator. Interactive tool for creating business documents including letters, proposals, memos, contracts, and meeting minutes using Typst templates. Requires `yq` and `gum`.

**nref** - Manage references and book quotes with JSON storage. Interactive CLI for adding and viewing references, books, and quotes. Requires `gum` and `jq`. Uses `$SEWS_REF_PATH` and `$SEWS_REA_PATH` environment variables.

**safe_reboot** - Safely reboot system after running `gsmr` to save git repositories.

**safe_shutdown** - Safely shutdown system after running `gsmr` to save git repositories.

**vpn** - VPN connection management using nmcli. Connect with `-i <list>` (include), `-e <list>` (exclude), `-a` (all). Disconnect with `-d <vpn>` or `-D` (all).

## Dependencies

- `gum` - Interactive CLI components
- `jq` - JSON processor
- `yq` - YAML processor
- `curl` - HTTP client
