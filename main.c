#include "types.h"
#include "defs.h"

void puts(char *s) {
    while (*s) uartputc(*s++);
    uartputc('\n');
}

int
entry() {
    // \uXXXX e \UXXXXXXXX são chamados universal-character-name
    puts("\u26F0  ROS - Roncador Operating System (V0.1) \U0001F920");
    int c;
    for(;;) {
        c = uartgetc();
        if (c == -1)
            continue;
        switch(c) {
            case 127:
                uartputc('\b');
                uartputc(' ');
                uartputc('\b');
                break;
            case '\r':
                puts("\r\n");
                break;
            default:
                uartputc(c);
        }
    }
    return 0;
}
