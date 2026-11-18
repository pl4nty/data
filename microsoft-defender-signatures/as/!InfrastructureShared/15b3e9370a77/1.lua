-- Threat: !InfrastructureShared
-- Name: 15b3e9370a77
-- Type: 21

local l_0_0 = pcall(bm.get_connection_string)
if l_0_0:match("DestIp=5.149.248.") or l_0_0:match("DestIp=79.142.66.") or l_0_0:match("DestIp=217.23.15.") or l_0_0:match("DestIp=65.98.83.") or l_0_0:match("DestIp=69.57.173.") or l_0_0:match("DestIp=74.82.216.") or l_0_0:match("DestIp=88.198.247.") or l_0_0:match("DestIp=98.142.243.") then
  return mp.INFECTED
end
return mp.CLEAN
