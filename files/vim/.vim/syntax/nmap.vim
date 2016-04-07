" Vim syntax file
" Language: nmap file
" Maintainer: Pento <naplanetu@gmail.com>
" Last change: 2008 Oct 12

if version < 600 
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syntax sync fromstart
syn match nmapNewHost "^Nmap scan report for "

syn keyword nmapStatement PORT STATE SERVICE VERSION TRACEROUTE ADDRESS HOP RTT 
syn keyword nmapService http https printer ipp jetdirect afp nfs rendezvous cslistener unknown vnc distinct32 utftp finger ssh snmp smtp pop3 telnet rdp ftp ssl domain msrpc microsoft-ds netbios-ssn echo discard daytime c  hange
syn match   nmapService "netbios-ssn\|microsoft-ds\|ies-lm\|rpcbind"
syn match  nmapComment "#.*$"
syn match  nmapPort "\d\+/"
syn keyword nmapPortStatus  open filtered closed
syn keyword nmapProto hopopt icmp igmp ggp ip st tcp cbt egp igp bbn-rcc-mon nvp-ii pup argus emcon xnet chaos udp mux dcn-meas hmp prm xns  -idp trunk-1 trunk-2 leaf-1 leaf-2 rdp irtp iso-tp4 netblt mfe-nsp merit-inp dccp 3pc idpr xtp ddp idpr-cmtp tp++ il ipv6 sdrp ipv6-route i  pv6-frag idrp rsvp gre mhrp bna esp ah i-nlsp swipe narp mobile tlsp skip ipv6-icmp ipv6-nonxt ipv6-opts anyhost cftp anylocalnet sat-expak   kryptolan rvd ippc anydistribfs sat-mon visa ipcv cpnx cphb wsn pvp br-sat-mon sun-nd wb-mon wb-expak iso-ip vmtp secure-vmtp vines ttp ns  fnet-igp dgp tcf eigrp ospfigp sprite-rpc larp mtp ax.25 ipip micp scc-sp etherip encap anyencrypt gmtp ifmp pnni pim aris scps qnx a/n ipc  omp snp compaq-peer ipx-in-ip vrrp pgm any0hop l2tp ddx iatp stp srp uti smp sm ptp isis-ipv4 fire crtp crudp sscopmce iplt sps pipe sctp f  c rsvp-e2e-ignore mobility-hdr udplite mpls-in-ip experimental1 experimental2 

syn match nmapResultField "^MAC Address" 
syn match nmapResultField "^Device type" 
syn match nmapResultField "^Running"
syn match nmapResultField "^OS CPE"
syn match nmapResultField "^OS details"
syn match nmapResultField "^Uptime guess"
syn match nmapResultField "^Network Distance"
syn match nmapResultField "^TCP Sequence Prediction"
syn match nmapResultField "^IP ID Sequence Generation"
syn match nmapResultField "^Aggressive OS guesses"

syn match nmapResultValue ": .\+$" 

syn match nmapIP "\d\+\.\d\+\.\d\+\.\d\+"
syn match nmapHostName "[a-zA-Z0-9._-]\+\.[a-zA-Z]\{2,3}"


if version >= 508 || !exists("did_nmap_syn_inits")
if version <= 508 
    let did_w3af_syn_inits = 1 
    command -nargs=+ HiLink hi link <args>
else
    command -nargs=+ HiLink hi def link <args>
endif
" The default methods for highlighting.  Can be overridden later
HiLink nmapResultField    Comment
HiLink nmapResultValue    Float
HiLink nmapNewHost        Underlined
HiLink nmapStatement      Constant
HiLink nmapComment        Comment
HiLink nmapPortStatus     Function
HiLink nmapProto          Special
HiLink nmapIP             Underlined
HiLink nmapHostName       Underlined
HiLink nmapPort           Operator
HiLink nmapService        Statement
delcommand HiLink
endif

let b:current_syntax = 'nmap'                         
