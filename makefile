.PHONY: clean all

# ifndef MISSIONS
# $(error "MISSIONS was not defined")
# endif
APPS := test1 test2 test3

ifdef INDEX
# NOTE: can you pass bash shell commands outside of recipes???
#	make test$(INDEX).exe
	APPS := test$(INDEX)
endif

$(shell mkdir -p build/)

build/%.exe: src/%.c build
	gcc $< -o $@

all: $(addsuffix .exe, $(addprefix build/, $(APPS)))
	
clean:
	rm -r build