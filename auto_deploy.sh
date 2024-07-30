#!/usr/bin/env bash
#
# auto_deploy.sh
#
# Michael Potter
# 2022-04-30

export KUBECONFIG=~/.kube/personal

pod=$(kubectl get pods | egrep '^printer' | acut 1)

d=octoprint_pushover_mlpotter
copy_cmd="kubectl cp octoprint_pushover/__init__.py $pod:/octoprint/plugins/lib/python3.10/site-packages/octoprint_pushover"
# copy_cmd="cp -r $d/* /home/mlpotter/tmp/octoprint_plugin_test/venv/lib/python3.10/site-packages/octoprint_pushover"
fd __init__.py | entr $copy_cmd
