
ASFLAGS := -g

default: tee

tee.o: tee.s
	$(AS) $(ASFLAGS) -o $@ $<

tee: tee.o
	$(LD) $(LDFLAGS) -o $@ $^

debug: tee
	gdb ./tee

.PHONY: debug
