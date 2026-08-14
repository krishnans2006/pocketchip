# Pocket CHIP

This packages [CHIP-tools](https://git.sr.ht/~nytpu/CHIP-tools) with Nix. I highly recommend [this guide](https://nytpu.com/gemlog/2021-04-15) for proper usage.

To activate, run:

```bash
nix develop
```

Note that using this repo changes how shell scripts are run. For example, `./chip-update-firmware.sh -p` becomes `chip-update-firmware -p`.
