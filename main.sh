#!/bin/bash
# * Copyright © 2025 Mohamed Ashraf
# *
# * Permission to use, copy, modify, distribute, and sell this software and its
# * documentation for any purpose is hereby granted without fee, provided that
# * the above copyright notice appear in all copies and that both that
# * copyright notice and this permission notice appear in supporting
# * documentation, and that the name of Mohamed Ashraf not be used in
# * advertising or publicity pertaining to distribution of the software without
# * specific, written prior permission. Mohamed Ashraf  makes no
# * representations about the suitability of this software for any purpose.  It
# * is provided "as is" without express or implied warranty.
# *
# * MOHAMED ASHRAF DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
# * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
# * EVENT SHALL MOHAMED ASHRAF BE LIABLE FOR ANY SPECIAL, INDIRECT OR
# * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
# * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
# * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# * PERFORMANCE OF THIS SOFTWARE.
./env/base.sh

if [ "$@" == "--sourcemod" ]; then
	echo "What is the SDK version number? (example: 2006)"
	read VER
	echo "Where is the location of your mod's source code? (example: /home/$USER/modsrc)"
	read CWD
	if [[ "$VER" == "2013" || "$VER" == "2006" || "$VER" == "2007" || "$VER" == "asw" ]]; then
		echo "VER is valid: $VER"
		if [["$VER" == "2006" || "$VER" == "2007" || "$VER" == "asw"]]; then
			if [ -d !"$(pwd)/build" ]; then
				mkdir -p $(pwd)/build/
			fi
				cd $CWD
				if [ -d !"$CWD/linux_sdk" ]; then
					wget https://web.archive.org/web/20160406055836/https://vcprojtomake2010.googlecode.com/files/2010_11_25_vcprojtomake_2010.zip
					unzip 2010_11_25_vcprojtomake_2010.zip
					cp -r 2010_11_25_vcprojtomake_2010/* $(pwd)/
					cd linux_sdk
					make
					cd ../
				fi
		fi
		if [[ "$@" == "--android" ]]; then
			if [[ $OS == "Linux" ]]; then
				wget https://dl.google.com/android/repository/android-ndk-r27c-linux.zip
				unzip $(pwd)/android-ndk-r27c-linux.zip
				export ANDROID_NDK=$(pwd)/android-ndk-r27c-linux
				export ANDROID_TOOLCHAIN_VERSION=gcc
				export PATH=$ANDROID_NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin:$PATH
				export CROSS_COMPILE=arm-linux-androideabi-gcc
				export BEGIN_FILE=$CROSS_COMPILE *.c *.cpp *.h
				export OUT=-o $PROJNAME.so -L$ANDROID_NDK/platforms/android-21/arch-arm/usr/lib -landroid
			else
				echo "Not compiling for Android, operating system unsupported"
			fi
		fi
	else
		echo "Invalid VER: $VER"
		exit -1
	fi
fi

./$PROJLIST