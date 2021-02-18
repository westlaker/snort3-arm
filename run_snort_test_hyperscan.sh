snort --rule-path /usr/local/etc/rules/ -c /usr/local/etc/snort/snort.lua --lua 'search_engine.search_method = "hyperscan"' -r /root/snort-pcaps/maccdc2012_00001.pcap

