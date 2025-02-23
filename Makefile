.POSIX:
ALL_WARNING = -Wall -Wextra -pedantic
ALL_LDFLAGS = $(LDFLAGS)
PREFIX = /usr/local
LDLIBS = -lm
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man

all: clean kirc
install: all
	mkdir -p $(DESTDIR)$(BINDIR)
	mkdir -p $(DESTDIR)$(MANDIR)/man1
	cp -f kirc $(DESTDIR)$(BINDIR)
	cp -f kirc.1 $(DESTDIR)$(MANDIR)/man1
	chmod 755 $(DESTDIR)$(BINDIR)/kirc
	chmod 644 $(DESTDIR)$(MANDIR)/man1/kirc.1
kirc: kirc.o
	$(CC) $(ALL_LDFLAGS) -o kirc kirc.o $(LDLIBS)
kirc.o: kirc.c kirc.h
clean:
	rm -f kirc *.o
uninstall:
	rm -f $(DESTDIR)$(BINDIR)/kirc
	rm -f $(DESTDIR)$(MANDIR)/man1/kirc.1
.PHONY: all install uninstall clean
