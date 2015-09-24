#!/bin/bash
#
# Copyright (c) 2014-2015 NEC Corporation
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without fee is hereby granted, provided that the above copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR(S) DISCLAIM ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL AUTHORS BE LIABLE FOR ANY
# SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER
# RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF
# CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
# CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#

for cmm in mercury1cmm mercury2cmm mercury3cmm
do
grep $cmm /etc/hosts >>/dev/null

if [ $? -ne 0 ]; then
#  echo $cmm
  continue
fi
ip=`grep $cmm /etc/hosts | cut -f 1`
echo $ip
ipmiaw2 $ip raw 0x30 0x40 0xFF 0x01 0x00
#OFF:ipmitool -I lanplus -H $cmm -U Administrator -P Administrator raw 0x30 0x40 0xFF 0x01 0x00
done


