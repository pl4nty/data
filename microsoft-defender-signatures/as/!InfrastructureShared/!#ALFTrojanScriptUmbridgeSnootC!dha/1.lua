-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Script/UmbridgeSnoot.C!dha
-- Type: 24
-- MpAttributes: (Lua:HTMExt | Lua:HTMLExt | Lua:JSExt)

local l_0_0 = mp.enum_mpattributesubstring("SCPT:UmbridgeSnootC")
if 2 <= #l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
