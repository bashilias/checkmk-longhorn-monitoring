# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] - 2026-06-29

### Added

- Initial release of Longhorn Storage Monitoring for CheckMK
- check_longhorn_faulted: Monitor volumes in faulted/degraded state
- check_longhorn_failed_jobs: Monitor failed Longhorn jobs (excluding trim jobs)
- check_longhorn_instance_managers: Monitor instance manager health and scheduling
- check_longhorn_attaching: Detect volumes stuck in attaching state
- Comprehensive README with installation and troubleshooting guide
- Production-ready scripts with proper error handling
- Metric collection for all monitored states
