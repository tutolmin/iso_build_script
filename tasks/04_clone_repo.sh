#!/usr/bin/env bash

function clone_repo_init() {
  task_setup "clone_repo" "Cloning repository" "Cloning live debian ISO repository"

  settings_init ".settings"
}

function clone_repo_skip() {
  log_info "clone_repo_skip called"
}

function clone_repo_run() {
  log_info "Cloning repository..."

  log_command git clone https://gitlab.com/nodiscc/debian-live-config

  if [ $? -ne 0 ]; then
  	log_error "Repository cloning error"
	return ${E_FAILURE}
  fi

  return ${E_SUCCESS}
}
