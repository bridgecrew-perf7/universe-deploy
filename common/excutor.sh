#!/bin/bash

project_dir=""
project_version=""
action=""

OPT_ARGS=$(
  getopt -o a:d:v: \
    -al action:,project-dir:,project-version: \
    -- "$@"
)

eval set -- "$OPT_ARGS"

while [ -n "$1" ]; do
  case $1 in
  -a | --action)
    action=$2
    shift 2
    ;;
  -d | --project-dir)
    project_dir=$2
    shift 2
    ;;
  -v | --project-version)
    project_version=$2
    shift 2
    ;;
  --) break ;;
  *)
    echo "$1","$2"
    break
    ;;
  esac
done

echo "$action", "$project_dir", "$project_version"
case $action in
"build") ./build.sh ;;
"deploy") ./deploy.sh ;;
*) echo "Unknown action: $action";;
esac
