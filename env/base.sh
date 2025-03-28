#!/bin/bash
#  * Copyright © 2025 Mohamed Ashraf
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
export OS=$(uname) \
PROJLIST="$(pwd)/zenith/groups.zth"  \
CC="gcc" \
Define=$(export)

case $OS in
"Darwin")
	echo "OSX is currently unsupported"
	exit -1
	;;
"Linux")
	echo "Expecting Linux"
	export BEGIN_FILE="$CC *.c *.cpp *.h"
	export OUT="-o $PROJNAME.so"
	;;
*)
	echo "Unknown OS, expecting Windows."
	export BEGIN_FILE="$CC *.c *.cpp *.h"
	export OUT="-o $PROJNAME.dll"
    #export OUT="-o $PROJNAME.eze"
	;;
esac