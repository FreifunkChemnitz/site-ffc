GLUON_SITE_PACKAGES := \
        gluon-autoupdater \
	gluon-mesh-batman-adv-15 \
	gluon-alfred \
	gluon-respondd \
	gluon-autoupdater \
	gluon-setup-mode \
	gluon-config-mode-core \
	gluon-config-mode-hostname \
	gluon-config-mode-mesh-vpn \
	gluon-config-mode-geo-location \
	gluon-config-mode-contact-info \
	gluon-ebtables-filter-multicast \
	gluon-ebtables-filter-ra-dhcp \
	gluon-authorized-keys \
	gluon-web-admin \
	gluon-web-autoupdater \
	gluon-web-wifi-config \
	gluon-mesh-vpn-fastd \
	gluon-radvd \
	gluon-status-page \
	iwinfo \
	iptables \
	haveged

FLASH_4MB := false
ifeq ($(GLUON_TARGET),ar71xx-tiny)
       FLASH_4MB := true
endif
ifeq ($(GLUON_TARGET),ramips-rt305x)
       FLASH_4MB := true
endif

ifeq ($(FLASH_4MB),false)
GLUON_SITE_PACKAGES += \
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
	kmod-usb-storage
endif

ifeq ($(GLUON_TARGET),x86-64)
GLUON_SITE_PACKAGES += \
    kmod-usb-core \
    kmod-usb2 \
    kmod-usb-hid
endif

DEFAULT_GLUON_RELEASE := b$(shell date '+%Y%m%d')floe

GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

GLUON_PRIORITY ?= 3

GLUON_LANGS ?= de

GLUON_ATH10K_MESH ?= 11s

GLUON_REGION ?= eu
