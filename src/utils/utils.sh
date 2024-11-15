# Logging function
log() {
    local message="$1"
    local status="$2"
    local timestamp
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")

    case "$status" in
        "Success") echo -e "\\033[1;32m✔ [$timestamp] $message: $status\\033[0m" | tee -a "$LOG_FILE" ;;
        "Warning") echo -e "\\033[1;33m⚠ [$timestamp] $message: $status\\033[0m" | tee -a "$LOG_FILE" ;;
        "Error") echo -e "\\033[1;31m✘ [$timestamp] $message: $status\\033[0m" | tee -a "$LOG_FILE" ;;
        *) echo "[$timestamp] $message: $status" | tee -a "$LOG_FILE" ;;
    esac
}

# Sudo wrapper
run_as_root() {
    sudo -v  # Refresh sudo timestamp
    sudo "$@"
}
