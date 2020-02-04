Content-Type: multipart/mixed; boundary="===============0086047718136476635=="
MIME-Version: 1.0

--===============0086047718136476635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="config"

config system global
set hostname ${fgt1_id}
set admintimeout 30
end

config router static
edit 1
set gateway ${public_subnet1_router_ip}
set device port1
end

config system interface
edit "port1"
set mode static
set ip ${fgt1_port1} 255.255.255.0
set allowaccess ping https ssh fgfm
next
edit "port2"
set mode static
set ip ${fgt1_port2} 255.255.255.0
set allowaccess ping https ssh fgfm
next
edit "port3"
set mode static
set ip ${fgt1_port3} 255.255.255.0
set allowaccess ping
next
edit "port4"
set mode static
set ip ${fgt1_port4} 255.255.255.0
set allowaccess ping https ssh fgfm
next
end

config system ha
set group-name "ha"
set mode a-p
set hbdev "port3" 0
set ha-mgmt-status enable
config ha-mgmt-interfaces
edit 1
set interface "port4"
set gateway ${hamgmt_subnet1_router_ip}
next
end
set override disable
set priority 200
set unicast-hb enable
set unicast-hb-peerip ${fgt2_port3}
end


config firewall policy
edit 1
set name "vpc-internet_access"
set srcintf "port2"
set dstintf "port1"
set srcaddr "all"
set dstaddr "all"
set action accept
set schedule "always"
set service "ALL"
set utm-status enable
set logtraffic all
set av-profile "default"
set webfilter-profile "default"
set ips-sensor "default"
set application-list "default"
set ssl-ssh-profile "certificate-inspection"
set nat enable
next
end




--===============0086047718136476635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="license"

${fgt1_byol_license}

--===============0086047718136476635==--