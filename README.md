# Performance Testing Platform!
# Installation
## Setting Up Pipeline
## Adding Self-Hosted Azure Agent
## Adding Kubernetes Se
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
C --> B
:::