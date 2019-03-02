#!/bin/bash
rm -r tmp/pids
bundle install
rails server
