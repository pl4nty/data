-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Script/Verticite.A!dha
-- Type: 24
-- MpAttributes: (Lua:PYExt)

local l_0_0 = mp.enum_mpattributesubstring("SCPT:Verticite")
if 3 <= #l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
