#!/bin/bash -ex

# Default values
param1=""

# Help function
usage() {
    echo "Usage: $0 <param1>"
    echo
    echo "Arguments:"
    echo "  test|start|stop|remove"
    exit 1
}
# Handle positional parameters
if [ $# -lt 1 ]; then
    echo "Error: Missing required parameter param1" >&2
    usage
fi

param1=$1

echo "Param1: $param1"

if [[ "$param1" == "test" ]]; then
  cd app || exit 1
  python manage.py runserver
  cd ..
fi

if [[ "$param1" == "start" ]]; then
  pulumi up
fi

if [[ "$param1" == "stop" ]]; then
  pulumi refresh -y && pulumi down
fi

if [[ "$param1" == "destroy" ]]; then
  PREFIX="djando-app-ecr-repo"  # Change this to your desired prefix
  REGION="eu-west-1"  # Change this to your AWS region
  # List repositories, filter those with the prefix, and delete them
  aws ecr describe-repositories --region "$REGION" --query "repositories[?starts_with(repositoryName, '$PREFIX')].repositoryName" --output text | while read -r REPO; do
      echo "Deleting repository: $REPO"
      aws ecr delete-repository --repository-name "$REPO" --region "$REGION" --force
  done

fi

# Exit script successfully
exit 0
