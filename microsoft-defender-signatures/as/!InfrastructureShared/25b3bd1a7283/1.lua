-- Threat: !InfrastructureShared
-- Name: 25b3bd1a7283
-- Type: 21

local l_0_0 = bm.get_connection_string()
if l_0_0:find("DestIp=185.22.172.157;", 1, true) or l_0_0:find("DestIp=91.121.222.184;", 1, true) or l_0_0:find("DestIp=185.22.172.69;", 1, true) or l_0_0:find("DestIp=185.18.53.247;", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
