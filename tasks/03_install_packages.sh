function install_packages_init() {
  task_setup "install_packages" "Install packages" "Install system packages"
}

function install_packages_run() {
  log_info "Installing packages..."
  
  log_command apt install make git sudo live-build
  if [ $? -ne 0 ]; then
    log_error "Failed to install packages."
    return ${E_FAILURE}
  fi

  return ${E_SUCCESS}
}
