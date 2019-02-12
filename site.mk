GLUON_FEATURES := \
	alfred \
	autoupdater \
	config-mode-geo-location-osm \
	ebtables-filter-multicast \
	ebtables-filter-ra-dhcp \
	ebtables-limit-arp \
	authorized-keys \
	mesh-batman-adv-15 \
	mesh-vpn-fastd \
	radvd \
	respondd \
	status-page \
	web-advanced \
	web-wizard \
	web-osm

GLUON_SITE_PACKAGES := \
	iwinfo \
	haveged \
	wodca

FLASH_4MB := false
ifeq ($(GLUON_TARGET),ar71xx-tiny)
       FLASH_4MB := true
endif
ifeq ($(GLUON_TARGET),ramips-rt305x)
       FLASH_4MB := true
endif

ifeq ($(FLASH_4MB),false)
GLUON_SITE_PACKAGES += \
  pciutils \
	comgt \
	ppp \
	kmod-fs-ext4 \
	kmod-nls-utf8 \
	kmod-usb2 \
	kmod-usb-hid \
	kmod-usb-net \
	kmod-usb-net-asix \
	kmod-usb-net-cdc-ether \
	kmod-usb-serial \
	kmod-usb-serial-option \
	kmod-usb-serial-wwan \
	kmod-usb-storage \
	respondd-module-airtime
endif

ifeq ($(GLUON_TARGET),x86-64)
GLUON_SITE_PACKAGES += \
	kmod-phy-broadcom \
	qemu-ga
endif

DEFAULT_GLUON_RELEASE := b$(shell date '+%Y%m%d')

GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)-z

GLUON_PRIORITY ?= 3

GLUON_LANGS ?= de

GLUON_ATH10K_MESH ?= 11s

GLUON_REGION ?= eu
