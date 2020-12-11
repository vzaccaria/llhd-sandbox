# Setting up

To setup the docker container:

```
docker build . -t llhd-latest
```

This will create the container llhd-latest and install a few commands, among
which the moore compiler (which translates, among other things, verilog file
into llhd).

# Compiling the example verilog file

The example file is a masked implementation of the keccak sbox (original version
in [the MaskVerif repo](https://gitlab.com/benjgregoire/maskverif):

```
make keccak.llhd
```
