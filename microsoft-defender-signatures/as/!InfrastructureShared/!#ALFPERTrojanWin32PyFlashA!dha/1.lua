-- Threat: !InfrastructureShared
-- Name: !#ALFPER:Trojan:Win32/PyFlash.A!dha
-- Type: 13

local l_0_0 = mp.getfilesize()
if 268435456 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("SCPT:PyFlashA")
if 5 <= #l_0_1 then
  return mp.INFECTED
else
  return mp.CLEAN
end
return mp.CLEAN
