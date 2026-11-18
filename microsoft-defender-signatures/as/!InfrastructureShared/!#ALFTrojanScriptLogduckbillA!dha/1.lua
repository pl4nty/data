-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Script/Logduckbill.A!dha
-- Type: 24

local l_0_0 = mp.enum_mpattributesubstring("SCPT:LogduckbillA")
if 2 <= #l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
