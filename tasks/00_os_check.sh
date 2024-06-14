#!/usr/bin/env bash

function os_check_init() {
  task_setup "os_check" "Checking OS" "Checking OS type and version."

  settings_init ".settings"
}

function os_check_skip() {
  log_info "os_check_skip called"
}

function os_check_run() {
  log_info "Checking OS..."

  log_command which lsb_release
  if [ $? -ne 0 ]; then
  	log_error "LSB not found"
	return ${E_FAILURE}
  fi

  os=$(lsb_release -i|grep -i Debian)

  if [ $? -ne 0 ]; then
  	log_error "We should build debian on Debian"
	return ${E_FAILURE}
  fi

  settings_set "os" "$os" 

  return ${E_SUCCESS}
}
