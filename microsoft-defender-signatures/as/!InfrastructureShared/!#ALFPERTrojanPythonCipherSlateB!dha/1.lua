-- Threat: !InfrastructureShared
-- Name: !#ALFPER:Trojan:Python/CipherSlate.B!dha
-- Type: 13

local l_0_0 = mp.getfilesize()
if 16777216 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.enum_mpattributesubstring("SCPT:CipherSlateB")
if 2 <= #l_0_1 then
  return mp.INFECTED
else
  return mp.CLEAN
end
return mp.CLEAN
