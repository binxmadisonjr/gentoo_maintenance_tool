# Gentoo Maintenance Tool

A modular and customizable shell script for maintaining Gentoo Linux systems. This tool helps automate repetitive tasks like installing necessary utilities, managing logs, and performing regular system maintenance.

## Features

- Modular design for flexibility and easy updates
- Logging system for tracking actions and results
- Integration with `dialog` for interactive menus
- Customizable configurations via the `config/` directory

## Installation

1. Clone the repository:
   ```bash
   git clone git@github.com:binxmadisonjr/gentoo_maintenance_tool.git
   cd gentoo_maintenance_tool
   ```

2. Ensure you have `dialog` installed:
   ```bash
   sudo emerge --ask dev-util/dialog
   ```

3. Make the main script executable:
   ```bash
   chmod +x main.sh
   ```

## Usage

Run the tool with:
```bash
./main.sh
```

Follow the interactive prompts to perform various maintenance tasks.

## Project Structure

```plaintext
gentoo_maintenance_tool/
├── config/              # Configuration files
│   └── dialogrc         # Dialog UI configuration
├── logs/                # Logs for script actions
├── src/                 # Source files
│   ├── modules/         # Modular scripts
│   │   ├── install_dialog.sh
│   │   └── maintenance.sh
│   ├── themes/          # Themes for the UI
│   └── utils/           # Utility functions
├── tmp/                 # Temporary files
├── main.sh              # Main script entry point
└── README.md            # Documentation
```

## Contributing

Contributions are welcome! Feel free to fork the repository, make changes, and submit a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Acknowledgments

Special thanks to the Gentoo community for inspiration and support.
