-- Threat: !InfrastructureShared
-- Name: 25b3b21219de
-- Type: 21

local l_0_0, l_0_1, l_0_2 = bm.get_connection_string():find("DestIp=(.-;)")
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = ";" .. l_0_2
local l_0_3 = ";217.23.8.164;85.17.87.163;46.165.244.105;209.239.112.229;185.6.80.139;184.75.253.146;176.9.245.16;178.250.245.198;217.23.3.113;217.23.8.164;"
if l_0_3:find(l_0_2, 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
