#!/bin/bash

# This is a build script to run make for all the supported GLUON_TARGETS and our gluon site configurations.
# Copyright (C) 2017  Matthias Fritzsche

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# SPDX-License-Identifier: AGPL-3.0

BRANCH="stable"
STABLE_TARGETS="ar71xx-generic ar71xx-tiny x86-generic x86-geode x86-64 ar71xx-nand mpc85xx-generic ramips-mt7621 sunxi"
TARGETS="$STABLE_TARGETS"
GLUON_RELEASE="b"$(date '+%Y%m%d')"z-★" # unused stable release symbols: ♟♞♝♜♛♚🗲™⚑♫⛾⛭🖬♙♘♗♖♕♔♧♤♡♢  / used: ★
THREADS=$(expr $(nproc) + 1)

RETCODE="0"

rm ../output/images/factory/* ../output/images/sysupgrade/*
start=$(date +%s)
for TARGET in $TARGETS; do
	echo "################# $(date) start building target $TARGET ###########################"
	make -C ../ -j$THREADS GLUON_RELEASE=$GLUON_RELEASE GLUON_TARGET=$TARGET GLUON_BRANCH=$BRANCH BROKEN=1
	CURRENTRET=$?
	RETCODE=$[ $RETCODE + $CURRENTRET ]
	if [ $CURRENTRET -ne "0" ]; then
		echo $(date -Isecond)" could not build $TARGET" >> build.messages
	fi
done
echo -n "finished: "; date
echo "Dauer: $((($(date +%s)-start)/60)) Minuten"
echo "########################### start creating manifest ###########################"
make -C ../ manifest GLUON_BRANCH=$BRANCH GLUON_RELEASE=$GLUON_RELEASE GLUON_PRIORITY=1 BROKEN=1
if [ $RETCODE -ne "0" ]; then
	echo $(date -Isecond)" something went wrong while building"
fi
rm /var/www/html/zwickau/$BRANCH/factory/* /var/www/html/zwickau/$BRANCH/sysupgrade/*
mkdir /var/www/html/zwickau/$BRANCH/ 2> /dev/null || touch /var/www/html/zwickau/$BRANCH/
cp -r ../output/images/* /var/www/html/zwickau/$BRANCH/
echo "################################ sign manifest ################################"
../contrib/sign.sh /home/buildbot/keys/key.secret /var/www/html/zwickau/$BRANCH/sysupgrade/$BRANCH.manifest

