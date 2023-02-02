#!/bin/sh

# # Log into Azure DevOps using PAT Token
# az login
# az devops configure --defaults organization=https://dev.azure.com/$1

# # Create devops project
# az devops project create \
#     --name "Performance_Testing" \
#     --description "Repository to hold and run JMeter performance tests" \
#     --source-control "git" \
#     --visibility "private"

# Push code to main branch
az repos create --name "Performance_Testing"

git init .
git add --all
git commit -m "Initial Performance Testing Platform Commit"
git remote add origin https://$1@dev.azure.com/$1/Performance_Testing/_git/Performance_Testing
git push -u origin --all

# # Create build pipeline for self-hosted agents
# az pipelines create --name
#                     [--branch]
#                     [--description]
#                     [--detect {false, true}]
#                     [--folder-path]
#                     [--org]
#                     [--project]
#                     [--queue-id]
#                     [--repository]
#                     [--repository-type {github, tfsgit}]
#                     [--service-connection]
#                     [--skip-first-run {false, true}]
#                     [--yaml-path]
# Create build pipeline for grafana-influx

# Create build pipeline for test runs

# Create build pipeline for azure pipeline export - to other projects with shared aks connections