-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Script/GoffRocker.Conf.A
-- Type: 24
-- MpAttributes: Lua:JSONExt

local l_0_0 = mp.enum_mpattributesubstring("SCPT:GoffRocker.Conf")
if 3 <= #l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
