# Performance Testing Platform!
[x] - Allow multiple csv files to run (1 per pod)
[x] - Allow single csv file to run across pods
[x] - Allow Only JMX file without CSV to run 
[ ] - Azure terraform based infrastructure deployment
# Installation
## Setting Up Pipeline
## Adding Self-Hosted Azure Agent
## Adding Kubernetes Service Connection
# Additional guidance in setting JMeter properties
[JMeter Official Documentation](https://jmeter.apache.org/usermanual/functions.html#__P)  
[VSkills JMeter Properties and Variables](https://www.vskills.in/certification/tutorial/jmeter-properties-and-variables/)  
[Octoperf JMeter Properties](https://octoperf.com/blog/2019/01/14/flexible-test-plans/#run-time-property-changes)
# Setting Up JMeter Backend Listener
# Basic Visual Flow
::: mermaid
graph LR;
A[Azure DevOps] -- JMeter Folder --> B(Azure Build Pipeline)
B --> E[Pipeline JMX Dashboard]
B --> C{Kubernetes}
C --> F[Grafana Dashboard]
C --> G[Azuree Blob Storage]
C --> B
:::