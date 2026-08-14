# C.H.I.P. Tools

This packages [CHIP-tools](https://git.sr.ht/~nytpu/CHIP-tools) with Nix. I highly recommend [this guide](https://nytpu.com/gemlog/2021-04-15) for proper usage.

To activate, run:

```bash
nix develop
```

Note that using this repo changes how shell scripts are run. For example, `./chip-update-firmware.sh -p` becomes `chip-update-firmware -p`.

Have fun!

## Example usage

```bash
$ nix develop
$ chip-update-firmware -p
```

```
== Pocketchip selected ==
== preparing images ==
== Local/cached probe files located ==
== Staging for NAND probe ==
Image Name:   detect NAND
Created:      Mon Dec 31 19:00:00 1979
Image Type:   ARM Linux Script (uncompressed)
Data Size:    97 Bytes = 0.09 KiB = 0.00 MiB
Load Address: 00000000
Entry Point:  00000000
Contents:
   Image 0: 89 Bytes = 0.09 KiB = 0.00 MiB
waiting for fel...OK
waiting for fel......OK
NAND detected:
nand_erasesize=400000
nand_oobsize=680
nand_writesize=4000
== Downloading new UBI, this will be cached for future flashes. ==
--2026-08-14 16:40:02--  http://chip.jfpossibilities.com/chip/images/stable/pocketchip/126/chip-400000-4000-680.ubi.sparse
Resolving chip.jfpossibilities.com (chip.jfpossibilities.com)... 23.239.1.46
Connecting to chip.jfpossibilities.com (chip.jfpossibilities.com)|23.239.1.46|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 662700072 (632M)
Saving to: ‘chip-400000-4000-680.ubi.sparse’

chip-400000-4000-680.ubi.sparse   100%[===========================================================>] 632.00M  1.19MB/s    in 4m 17s

2026-08-14 16:44:19 (2.46 MB/s) - ‘chip-400000-4000-680.ubi.sparse’ saved [662700072/662700072]

Image Name:   flash pocketchip
Created:      Mon Dec 31 19:00:00 1979
Image Type:   ARM Linux Script (uncompressed)
Data Size:    2189 Bytes = 2.14 KiB = 0.00 MiB
Load Address: 00000000
Entry Point:  00000000
Contents:
   Image 0: 2181 Bytes = 2.13 KiB = 0.00 MiB
waiting for fel...OK
waiting for fastboot....................OK
Warning: skip copying UBI image avb footer due to sparse image.
Sending sparse 'UBI' 1/23 (28672 KB)               OKAY [  1.977s]
Writing 'UBI'                                      OKAY [  2.066s]
Sending sparse 'UBI' 2/23 (28672 KB)               OKAY [  1.913s]
Writing 'UBI'                                      OKAY [  5.446s]
Sending sparse 'UBI' 3/23 (28672 KB)               OKAY [  1.951s]
Writing 'UBI'                                      OKAY [ 12.276s]
Sending sparse 'UBI' 4/23 (28672 KB)               OKAY [  1.887s]
Writing 'UBI'                                      OKAY [ 12.268s]
Sending sparse 'UBI' 5/23 (28672 KB)               OKAY [  1.906s]
Writing 'UBI'                                      OKAY [ 12.262s]
Sending sparse 'UBI' 6/23 (28672 KB)               OKAY [  1.886s]
Writing 'UBI'                                      OKAY [ 12.251s]
Sending sparse 'UBI' 7/23 (28672 KB)               OKAY [  1.881s]
Writing 'UBI'                                      OKAY [ 12.265s]
Sending sparse 'UBI' 8/23 (28672 KB)               OKAY [  1.889s]
Writing 'UBI'                                      OKAY [ 12.244s]
Sending sparse 'UBI' 9/23 (28672 KB)               OKAY [  1.886s]
Writing 'UBI'                                      OKAY [ 12.269s]
Sending sparse 'UBI' 10/23 (28672 KB)              OKAY [  1.919s]
Writing 'UBI'                                      OKAY [ 12.250s]
Sending sparse 'UBI' 11/23 (28672 KB)              OKAY [  1.883s]
Writing 'UBI'                                      OKAY [ 12.268s]
Sending sparse 'UBI' 12/23 (28672 KB)              OKAY [  1.879s]
Writing 'UBI'                                      OKAY [ 12.246s]
Sending sparse 'UBI' 13/23 (28672 KB)              OKAY [  1.901s]
Writing 'UBI'                                      OKAY [ 12.255s]
Sending sparse 'UBI' 14/23 (28672 KB)              OKAY [  1.888s]
Writing 'UBI'                                      OKAY [ 12.242s]
Sending sparse 'UBI' 15/23 (28672 KB)              OKAY [  1.934s]
Writing 'UBI'                                      OKAY [ 12.286s]
Sending sparse 'UBI' 16/23 (28672 KB)              OKAY [  1.883s]
Writing 'UBI'                                      OKAY [ 12.269s]
Sending sparse 'UBI' 17/23 (28672 KB)              OKAY [  1.901s]
Writing 'UBI'                                      OKAY [ 12.257s]
Sending sparse 'UBI' 18/23 (28672 KB)              OKAY [  1.888s]
Writing 'UBI'                                      OKAY [ 12.252s]
Sending sparse 'UBI' 19/23 (28672 KB)              OKAY [  1.888s]
Writing 'UBI'                                      OKAY [ 12.261s]
Sending sparse 'UBI' 20/23 (28672 KB)              OKAY [  1.930s]
Writing 'UBI'                                      OKAY [ 12.253s]
Sending sparse 'UBI' 21/23 (28672 KB)              OKAY [  1.883s]
Writing 'UBI'                                      OKAY [ 12.264s]
Sending sparse 'UBI' 22/23 (28672 KB)              OKAY [  1.937s]
Writing 'UBI'                                      OKAY [  8.905s]
Sending sparse 'UBI' 23/23 (16384 KB)              OKAY [  1.116s]
Writing 'UBI'                                      OKAY [  4.960s]
Finished. Total time: 297.362s
Resuming boot                                      OKAY [  0.001s]
Finished. Total time: 0.001s


FLASH VERIFICATION COMPLETE.


   #  #  #
  #########
###       ###
  # {#}   #
###  '%######
  #       #
###       ###
  ########
   #  #  #


CHIP is ready to roll!
```
