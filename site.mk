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

GLUON_SITE_PACKAGES := iwinfo

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
