Build and install Snort3.1.1.0 on Arm with Arm's Hyperscan

We use this pcap for testing:

wget https://download.netresec.com/pcap/maccdc-2012/maccdc2012_00001.pcap.gz

Run this script to build and install snort3.1.1.0: ./build_snort3.sh

Eventually you will see the snort -V like this:

snort -V

   ,,_     -*> Snort++ <*-

  o"  )~   Version 3.1.1.0

   ''''    By Martin Roesch & The Snort Team

           http://snort.org/contact#team

           Copyright (C) 2014-2020 Cisco and/or its affiliates. All rights reserved.

           Copyright (C) 1998-2013 Sourcefire, Inc., et al.

           Using DAQ version 3.0.0

           Using LuaJIT version 2.1.0-beta3

           Using OpenSSL 1.1.1f  31 Mar 2020

           Using libpcap version 1.9.1 (with TPACKET_V3)

           Using PCRE version 8.44 2020-02-12

           Using ZLIB version 1.2.11

           Using FlatBuffers 1.12.0

           Using Hyperscan version 5.3.0 2021-02-10

           Using LZMA version 5.2.4


For test with multiple thread on multiple core, run:

./run_snort_mthread.sh 32

the snort will spawn 32 packet processing threads on 32 cores to process 32 same pcap files at same time.

