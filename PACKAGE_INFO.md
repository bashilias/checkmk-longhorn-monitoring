# Longhorn Storage Monitoring - CheckMK Package

## Package Details

- **Name**: longhorn-monitoring
- **Version**: 1.0.0
- **Author**: Ilias Yacoubi (contact@ilias.sh)
- **License**: MIT
- **Compatibility**: CheckMK 2.0.0+

## Quick Start

### For CheckMK Users

1. Download the package files
2. Run the installation script:
   ```bash
   sudo ./install.sh
   ```
3. Discover services in CheckMK

### For MKP Installation

1. Upload to CheckMK: Setup > Maintenance > Extension packages
2. Deploy via agent bakery or manual distribution
3. Discover services on Kubernetes control plane hosts

## What Gets Monitored

- Longhorn volumes in faulted/degraded state
- Failed backup and snapshot jobs
- Instance manager scheduling and health
- Volumes stuck in attaching state

## Scripts Included

1. `check_longhorn_faulted` - Volume health monitoring
2. `check_longhorn_failed_jobs` - Job failure detection
3. `check_longhorn_instance_managers` - Instance manager health
4. `check_longhorn_attaching` - Attachment state monitoring

## Support

Issues, questions, or contributions: contact@ilias.sh
