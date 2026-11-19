-- Threat: !InfrastructureShared
-- Name: !#ALFPER:Backdoor:ASP/AlphaLake.A!dha
-- Type: 13

local l_0_0 = mp.getfilesize()
if 1048576 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("SCPT:AlphaLakeA")
if 2 <= #l_0_1 then
  return mp.INFECTED
else
  return mp.CLEAN
end
return mp.CLEAN
