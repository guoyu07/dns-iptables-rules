#!/bin/sh
## Flexible updating of domain blacklist
## FIRST DEFINE VARIABLES

#IPCHAIN TO USE
IPCHAIN=dnsfilter

#Action to take when match is made DROP | REJECT | LOG | <CHAINNAME>
TARGET=DROP

#see if chain exists, if not initialize
if [ `iptables -L $IPCHAIN | wc -l` -lt 1 ]; then
    echo "adding chain $IPCHAIN"
    iptables -N $IPCHAIN
    iptables -I INPUT -p udp --dport 53 -j $IPCHAIN
fi

#FLUSH CHAIN
iptables -F $IPCHAIN

#Add default action
iptables -A $IPCHAIN -j RETURN

##Now for the rules  -- copied from domain-blacklist.txt

iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28=0x07737563 && 0x2c=0x6b646467 && 0x30=0x02636300" -j $TARGET -m comment --comment "DROP DNS Q suckddq.cc"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28=0x076e6170 && 0x2c=0x6966756e && 0x30=0x03636f6d" -j $TARGET -m comment --comment "DROP DNS Q napifun.com"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28=0x0768616b && 0x2c=0x34756d7a && 0x30=0x036e6574" -j $TARGET -m comment --comment "DROP DNS Q hak4umz.net"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28=0x06616e6f && 0x2c=0x6e736303 && 0x30=0x636f6d00" -j $TARGET -m comment --comment "DROP DNS Q anonsc.com"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28=0x03317831 && 0x2c=0x02637a00 && 0x30=0x00ff0001" -j $TARGET -m comment --comment "DROP DNS Q ANY 1x1.cz"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28=0x05626668 && 0x2c=0x6d6d0363 && 0x30=0x6f6d0000 && 0x34=0x10000100" -j $TARGET -m comment --comment "DROP DNS Q TXT bfhmm.com"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x1c=0x1d420100 && 0x28=0x03697363 && 0x2c=0x036f7267 && 0x30=0x0000ff00" -j $TARGET -m comment --comment "DROP DNS Q ANY isc.org dns.id 0x1d42"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x1c=0x2a390100 && 0x28=0x03697363 && 0x2c=0x036f7267 && 0x30=0x0000ff00" -j $TARGET -m comment --comment "DROP DNS Q ANY isc.org dns.id 0x2a39"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28&0xFFDFDFDF=0x07454445 && 0x2c&0xDFDFDFDF=0x4c494f4e && 0x30&0xFFDFDFFF=0x02535500" -j $TARGET -m comment --comment "DROP DNS Q edelion.su"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28&0xFFFFDFDF=0x0432534f && 0x2c&0xDFFFDFDF=0x45025255" -j $TARGET -m comment --comment "DROP DNS Q 2soe.ru"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28&0xFFDFDFDF=0x04524950 && 0x2c&0xDFFFDFDF=0x45034e45 && 0x30&0xDFFFFFFF=0x540000FF" -j $TARGET -m comment --comment "DROP DNS Q ANY ripe.net"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28&0xFFDFDFDF=0x0948495a && 0x2c&0xDFDFDFDF=0x42554c4c && 0x30&0xDFDFFFDF=0x4148024d && 0x34&0xDFFFFFFF=0x450000FF" -j $TARGET -m comment --comment "DROP DNS Q ANY hizbullah.me"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28&0xFFDFDFDF=0x11455647 && 0x2c&0xDFDFDFDF=0x454e4959 && 0x30&0xFFDFDFDF=0x2d4d4152 && 0x34&0xDFDFDFDF=0x4348454e && 0x38&0xDFDFFFDF=0x4b4f0243 && 0x3c&0xDFFFFFFF=0x43000001" -j $TARGET -m comment --comment "DROP DNS Q A evgeniy-marchenko.cc"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28&0xFFDFDFDF=0x05535256 && 0x2c&0xDFDFFFDF=0x4954034f && 0x30&0xDFDFFFFF=0x52470000" -j $TARGET -m comment --comment "DROP DNS Q srvit.org"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28&0xFFDFDFDF=0x0b504143 && 0x2c&0xDFDFDFDF=0x4b455444 && 0x30&0xDFDFDFDF=0x4556494c && 0x34&0xFFDFDFDF=0x03434f4d && 0x38&0xFFFFFFFF=0x0000ff00" -j $TARGET -m comment --comment "DROP DNS Q ANY packetdevil.com"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28&0xffdfdfdf=0x046a756e && 0x30&0xdfdfdfdf=0x65797761 && 0x36&0xffdfdfff=0x02696e00" -j $TARGET -m comment --comment "DROP DNS Q -DOS- junk.theywant.in"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28&0xffdfdfdf=0x03545854 && 0x2c&0xffdfdfdf=0x08505753 && 0x30&0xdfdfdfdf=0x45525645 && 0x34&0xdfffdfdf=0x5203434f && 0x38&0xdfffdfff=0x02554100 && 0x3c&0xffffff=0x001000" -j $TARGET -m comment --comment "DROP DNS Q TXT txt.pwserver.com.ua"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28&0xFFDFDFDF=0x04494554 && 0x2c&0xDFFFDFDF=0x46034f52 && 0x30&0xDFFFFFFF=0x470000FF" -j $TARGET -m comment --comment "DROP DNS Q ANY ietf.org"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28&0xFFDFDFDF=0x03514841 && 0x2c&0xFFDFDFFF=0x02434300" -j $TARGET -m comment --comment "DROP DNS Q qha.cc"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28&0xFFDFDFFF=0x064c4132 && 0x2c&0xDFDFDFFF=0x4c4f5702 && 0x30&0xDFDFFFFF=0x43430000" -j $TARGET -m comment --comment "DROP DNS Q la2low.cc"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28&0xFFDFDFDF=0x055a5a47 && 0x2c&0xDFDFFFDF=0x53540343 && 0x30&0xDFDFFFFF=0x4f4d0000" -j $TARGET -m comment --comment "DROP DNS Q zzgst.com"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28&0xFFDFFFDF=0x01410b50 && 0x2c&0xDFDFDFDF=0x41434b45 && 0x30&0xDFDFDFDF=0x54444556 && 0x34&0xDFDFFFDF=0x494c0343 && 0x38&0xDFDFFFFF=0x4f4d0000" -j $TARGET -m comment --comment "DROP DNS Q a.packetdevil.com"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28&0xFFDFDFDF=0x0758504c && 0x2c&0xDFDFDFDF=0x4f44494e && 0x30&0xFFDFDFDF=0x03434f4d" -j $TARGET -m comment --comment "DROP DNS Q xplodin.com"
iptables --insert $IPCHAIN -p udp --dport 53 -m u32 --u32 "0x28&0xFFDFDFFF=0x02414106 && 0x2c&0xDFDFDFFF=0x41534433 && 0x30&0xDFDFFFDF=0x53430343 && 0x34&0xDFDFFFFF=0x4f4d0000" -j $TARGET -m comment --comment "DROP DNS Q aa.asd3sc.com"