-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Script/Godex.B!dha
-- Type: 13

local l_0_0 = mp.enum_mpattributesubstring("SCPT:GodexB")
if 2 <= #l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
