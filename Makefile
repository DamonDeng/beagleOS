GCC:=~/dinstalled/armlinux/arm-eabi-4.4.3/bin/arm-eabi-gcc
AS:=~/dinstalled/armlinux/arm-eabi-4.4.3/bin/arm-eabi-as
LD:=~/dinstalled/armlinux/arm-eabi-4.4.3/bin/arm-eabi-ld
OBJCOPY:=~/dinstalled/armlinux/arm-eabi-4.4.3/bin/arm-eabi-objcopy



u-boot.bin:startup
	$(OBJCOPY) --gap-fil=0xff -O binary startup u-boot.bin


startup:startup.o
	$(LD) -Ttext 0x80008000 -entry start_armboot startup.o -o startup

startup.o:startup.S
	$(AS) -mlittle-endian -o startup.o startup.S

clean:
	rm startup.o startup u-boot.bin

