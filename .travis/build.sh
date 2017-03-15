#!/bin/bash

sshpass -p "${ROOT_PASS}" ssh -o "StrictHostKeyChecking no" root@oott.me "/bin/bash /www/docs/server/build.sh"
