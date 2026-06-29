# Longhorn Storage Monitoring for CheckMK

Author: Ilias Yacoubi (contact@ilias.sh)

## What this does

Monitors Longhorn storage on Kubernetes clusters. Checks for faulted volumes, failed jobs, instance manager health, and stuck attachments.

## Requirements

- CheckMK agent installed on a Kubernetes control plane node
- kubectl binary installed and configured
- Longhorn running in longhorn-system namespace
- kubeconfig at /root/.kube/config

## Installation

Copy scripts to /usr/lib/check_mk_agent/local/ on your control plane node:

```bash
cp check_longhorn_* /usr/lib/check_mk_agent/local/
chmod +x /usr/lib/check_mk_agent/local/check_longhorn_*
```

Ensure kubectl is configured for root user:

```bash
mkdir -p /root/.kube
cp /etc/rancher/rke2/rke2.yaml /root/.kube/config
```

Test the checks:

```bash
/usr/lib/check_mk_agent/local/check_longhorn_faulted
/usr/lib/check_mk_agent/local/check_longhorn_failed_jobs
/usr/lib/check_mk_agent/local/check_longhorn_instance_managers
/usr/lib/check_mk_agent/local/check_longhorn_attaching
```

## What gets monitored

check_longhorn_faulted
Monitors volume health. Reports volumes in faulted or degraded state.

check_longhorn_failed_jobs
Monitors Longhorn jobs. Reports failed backup and snapshot jobs. Excludes trim jobs since they only work on mounted volumes.

check_longhorn_instance_managers
Monitors instance manager pods. Critical check because instance manager failures prevent volume attachments. Reports managers in error or stopped state.

check_longhorn_attaching
Monitors volume attachment state. Reports volumes stuck in attaching state. Useful for detecting scheduling issues or resource exhaustion.

## Metrics

- faulted_volumes: Count of volumes in faulted state
- failed_jobs: Count of failed Longhorn jobs
- error_ims: Count of instance managers in error/stopped state
- total_ims: Total instance manager count
- attaching_volumes: Count of volumes stuck attaching

## Troubleshooting

kubectl not found:

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv kubectl /usr/local/bin/
```

Cannot connect to cluster:

```bash
sudo kubectl get nodes
ls -la /root/.kube/config
```

No data in CheckMK:

```bash
ls -l /usr/lib/check_mk_agent/local/check_longhorn_*
check_mk_agent | grep -i longhorn
```

Then rediscover services in CheckMK.

## Support
Contact: contact@ilias.sh
GitHub: https://github.com/bashilias/checkmk-longhorn-monitoring

