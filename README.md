# elbencho (A distributed storage benchmark for file systems and block devices with support for GPUs)

[elbencho](https://github.com/breuner/elbencho) in a docker. 

Saves you installation time, ready to use.

## Usage example

```bash
# docker run --rm uglyb0b/elbencho:v1.8-1 --help
elbencho - A distributed benchmark for file systems and block devices

Version: 1.8-0

Tests include throughput, IOPS and access latency. Live statistics show how the
system behaves under load and whether it is worth waiting for the end result.

Get started by selecting what you want to test...

Block devices or large shared files:
  $ elbencho --help-bdev

Many files in different directories:
  $ elbencho --help-multi

Multiple clients:
  $ elbencho --help-dist

See all available options (e.g. csv file output):
  $ elbencho --help-all

Happy benchmarking!
# docker run -t --rm --device /dev/sda uglyb0b/elbencho:v1.8-1 -r -b 4K --lat --direct --rand --size 1g /dev/sda
OPERATION RESULT TYPE        FIRST DONE  LAST DONE
========= ================   ==========  =========
READ      Elapsed ms       :       6001       6001
          IOPS             :       8219       8219
          Throughput MiB/s :         32         32
          Total MiB        :        192        192
          IO latency us    : [ min=91 avg=120 max=1583 ]
---
```
