#!/bin/sh

# Log into Azure DevOps using PAT Token
az login
az devops configure --defaults organization=https://dev.azure.com/$1

# Create devops project
az devops project create \
    --name "Performance_Testing" \
    --description "Repository to hold and run JMeter performance tests" \
    --source-control "git" \
    --visibility "private"

# Push code to main branch
az repos create --name "Performance_Testing"

git init .
git add --all
git commit -m "Initial Performance Testing Platform Commit"
git remote add origin https://$1@dev.azure.com/$1/Performance_Testing/_git/Performance_Testing
git push -u origin --all

# Create build pipeline for self-hosted agents
az pipelines create \
    --name "Self-hosted-ubuntu-agents-CI" \
    --branch "main" \
    --description "Pipeline to deploy self-hosted agents to AKS CLuster for long duration tests" \
    --detect "false" \
    --folder-path \
    --org "https://$1@dev.azure.com/$1" \
    --project "Performance_Testing" \
    --repository "Performance_Testing" \
    --repository-type "tfsgit" \
    --yml-path "azure-self-hosted-agent.yml"

# Create build pipeline for grafana-influx
az pipelines create \
    --name "InfluxDB-Grafana-CI" \
    --branch "main" \
    --description "Pipeline to deploy influxDB and grafana for jmeter monitoring to AKS CLuster" \
    --detect "false" \
    --folder-path \
    --org "https://$1@dev.azure.com/$1" \
    --project "Performance_Testing" \
    --repository "Performance_Testing" \
    --repository-type "tfsgit" \
    --yml-path "grafana-influx-agent.yml"

# Create build pipeline for test runs
az pipelines create \
    --name "Performance-Testing-CI" \
    --branch "main" \
    --description "Pipeline to run JMeter tests using AKS cluster" \
    --detect "false" \
    --folder-path \
    --org "https://$1@dev.azure.com/$1" \
    --project "Performance_Testing" \
    --repository "Performance_Testing" \
    --repository-type "tfsgit" \
    --yml-path "performance-testing.yml"

# Create build pipeline for azure pipeline export - to other projects with shared aks connections
az pipelines create \
    --name "Export-Performance-Testing-Pipeline-CI" \
    --branch "main" \
    --description "Pipeline to export performace testing pipeline to other projects within azure Org with shared variables / AKS Cluster" \
    --detect "false" \
    --folder-path \
    --org "https://$1@dev.azure.com/$1" \
    --project "Performance_Testing" \
    --repository "Performance_Testing" \
    --repository-type "tfsgit" \
    --yml-path "azure-export-pipeline.yml"