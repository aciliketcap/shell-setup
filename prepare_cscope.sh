#!/bin/bash
if [ ! -f cscope.out ]; then
	find . -name '*.c' -o -name '*.h' > cscope.files
	cscope -b
fi
