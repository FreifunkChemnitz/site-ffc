GLUON_SITE_PACKAGES := \
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
	gluon-luci-admin \
	gluon-luci-autoupdater \
	gluon-luci-portconfig \
	gluon-luci-wifi-config \
	gluon-next-node \
	gluon-mesh-vpn-fastd \
	gluon-radvd \
	gluon-status-page \
	iwinfo \
	iptables \
	haveged

ifeq ($(GLUON_TARGET),x86-generic)
GLUON_SITE_PACKAGES += \
    kmod-usb-core \
    kmod-usb2 \
    kmod-usb-hid
endif

ifeq ($(GLUON_TARGET),x86-generic)
GLUON_SITE_PACKAGES += \
        kmod-usb-core \
        kmod-usb2 \
        kmod-usb-hid
endif

ifeq ($(GLUON_TARGET),x86-64)
GLUON_SITE_PACKAGES += \
    kmod-usb-core \
    kmod-usb2 \
    kmod-usb-hid
endif

DEFAULT_GLUON_RELEASE := b$(shell date '+%Y%m%d')

GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

GLUON_PRIORITY ?= 3

GLUON_LANGS ?= de

GLUON_ATH10K_MESH ?= 11s

GLUON_REGION ?= eu
