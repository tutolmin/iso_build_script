#!/usr/bin/env bash

function make_iso_init() {
  task_setup "make_iso" "Building ISO" "Building ISO image"

  settings_init ".settings"
}

function make_iso_skip() {
  log_info "make_iso_skip called"
}

function make_iso_run() {
  log_info "Building ISO image..."

  cd debian-live-config >/dev/null 2>&1
  log_command make

  if [ $? -ne 0 ]; then
  	log_error "Error building ISO"
	return ${E_FAILURE}
  fi

  return ${E_SUCCESS}
}
