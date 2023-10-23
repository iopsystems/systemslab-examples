# Redis Benchmark

This folder contains configurations to run Redis benchmark within Systems Lab,
targeting VMs in GCP.

- `systemslab.libsonnet`: contains common utility functions. This file is
    provided by the installation and can be imported by any experiment config.
- `redis.conf`: the configuration file for `redis-server`
- `redis.jsonnet`: the core configuration of the experiment. It includes two
    jobs— `rpc-perf` as the load generator, and `redis` as the target to be
    benchmarked.
- `run-redis.sh`: a script to generate a collection of Redis experiments by
    sweeping 3 parameters— connection count, payload size, and read-write ratio.

