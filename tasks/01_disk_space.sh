#!/usr/bin/env bash

function disk_space_init() {
  task_setup "disk_space" "Checking disk space" "Checking available disk space"

  settings_init ".settings"
}

function disk_space_skip() {
  log_info "disk_space_skip called"
}

function disk_space_run() {
  log_info "Checking free disk space..."

  free_space=$(($(stat -f --format="%a*%S" .)))

  if [ "$free_space" -lt 12884901888 ]; then
  	log_error "We should have at least 12G avaliable on disk"
	return ${E_FAILURE}
  fi

  log_info "Available free disk space $free_space bytes"

  return ${E_SUCCESS}
}
