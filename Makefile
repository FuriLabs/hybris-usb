PREFIX ?= /usr
SBINDIR = $(PREFIX)/sbin
LIBDIR = $(PREFIX)/lib
TMPFILESDIR = $(LIBDIR)/tmpfiles.d
SHAREDIR = $(PREFIX)/share
CONFDIR = $(SHAREDIR)/usb-tethering

all:
	@echo "Nothing to build. Use 'make install' to install."

install:
	install -d $(DESTDIR)$(SBINDIR)
	install -m 755 usb-tethering $(DESTDIR)$(SBINDIR)/

	install -d $(DESTDIR)$(TMPFILESDIR)
	install -m 644 tmpfiles.d.usb-tethering.conf $(DESTDIR)$(TMPFILESDIR)/usb-tethering.conf

	install -d $(DESTDIR)$(CONFDIR)
	install -m 644 dhcpd.conf $(DESTDIR)$(CONFDIR)/

uninstall:
	rm -f $(DESTDIR)$(SBINDIR)/usb-tethering
	rm -f $(DESTDIR)$(TMPFILESDIR)/usb-tethering.conf
	rm -rf $(DESTDIR)$(CONFDIR)
