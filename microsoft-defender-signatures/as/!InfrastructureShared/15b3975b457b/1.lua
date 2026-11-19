-- Threat: !InfrastructureShared
-- Name: 15b3975b457b
-- Type: 21

local l_0_0, l_0_1 = pcall(bm.get_connection_string)
if l_0_0 and l_0_1:match("DestPort=4242;") then
  return mp.CLEAN
end
return mp.INFECTED
