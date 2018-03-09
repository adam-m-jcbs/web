#!/bin/bash

host_domain=amjacobs.net
sync_command="cd web && date | tee -a gitsync.out gitsync.err > /dev/null && git pull 1>>gitsync.out 2>>gitsync.err"

ssh $host_domain "$sync_command"
