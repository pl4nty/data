-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Script/Snukbun.C!dha
-- Type: 13

local l_0_0 = mp.enum_mpattributesubstring("SCPT:SnukbunC")
if 2 <= #l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
