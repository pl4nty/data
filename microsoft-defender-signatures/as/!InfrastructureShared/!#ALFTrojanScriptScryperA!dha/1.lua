-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Script/Scryper.A!dha
-- Type: 24

local l_0_0 = mp.enum_mpattributesubstring("SCPT:Scryper")
if 2 <= #l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
