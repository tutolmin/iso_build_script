#!/usr/bin/env bash

function inet_connection_init() {
  task_setup "inet_connection" "Checking internet" "Checking internet connection"

  settings_init ".settings"
}

function inet_connection_skip() {
  log_info "inet_connection_skip called"
}

function inet_connection_run() {
  log_info "Checking internet connection..."

  log_command wget -q --spider http://google.com

  if [ $? -ne 0 ]; then
  	log_error "No Internet connection. Unable to download packages."
	return ${E_FAILURE}
  fi

  return ${E_SUCCESS}
}
