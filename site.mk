GLUON_FEATURES := \
	authorized-keys \
	autoupdater \
	config-mode-domain-select \
	config-mode-geo-location-osm \
	ebtables-filter-multicast \
	ebtables-filter-ra-dhcp \
	ebtables-limit-arp \
	mesh-batman-adv-15 \
	mesh-vpn-fastd \
	radvd \
	respondd \
	status-page \
	web-advanced \
	web-mesh-vpn-fastd \
	web-node-role \
	web-wizard \
	web-osm

GLUON_FEATURES_tiny := \
        -config-mode-geo-location-osm \
	-web-mesh-vpn-fastd \
        -web-osm

GLUON_SITE_PACKAGES := \
	iwinfo

FLASH_4MB := false
ifeq ($(GLUON_TARGET),ath79-tiny)
		FLASH_4MB := true
endif

ifeq ($(FLASH_4MB),false)
GLUON_SITE_PACKAGES += \
	ath9k-htc-firmware \
	pciutils \
	comgt \
	ppp \
	kmod-fs-ext4 \
	kmod-nls-utf8 \
	kmod-phy-broadcom \
	kmod-usb2 \
	kmod-usb-hid \
	kmod-usb-net \
	kmod-usb-net-asix \
	kmod-usb-net-cdc-ether \
	kmod-usb-net-cdc-ncm \
	kmod-usb-net-huawei-cdc-ncm \
	kmod-usb-net-rtl8152 \
	kmod-usb-serial \
	kmod-usb-serial-option \
	kmod-usb-serial-wwan \
	kmod-usb-storage \
	respondd-module-airtime \
	usbutils
endif

ifneq (,$(findstring x86,$(GLUON_TARGET)))
GLUON_SITE_PACKAGES += \
	kmod-skge
endif

ifeq ($(GLUON_TARGET),x86-64)
GLUON_SITE_PACKAGES += \
	qemu-ga
endif

DEFAULT_GLUON_RELEASE := b$(shell date '+%Y%m%d')

GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)-multi

GLUON_AUTOUPDATER_BRANCH ?= stable
GLUON_AUTOUPDATER_ENABLED ?= 1
GLUON_PRIORITY ?= 14
GLUON_LANGS ?= de
GLUON_WLAN_MESH ?= 11s
GLUON_REGION ?= eu
GLUON_MULTIDOMAIN = 1
GLUON_DEPRECATED ?= update
