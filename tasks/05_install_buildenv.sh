#!/usr/bin/env bash

function install_buildenv_init() {
  task_setup "install_buildenv" "Install build env" "Install build environment"

  settings_init ".settings"
}

function install_buildenv_skip() {
  log_info "install_buildenv_skip called"
}

function install_buildenv_run() {
  log_info "Installing build environment..."

  cd debian-live-config 
  log_command make install_buildenv

  if [ $? -ne 0 ]; then
  	log_error "Error preparing build environment"
	return ${E_FAILURE}
  fi

  return ${E_SUCCESS}
}
