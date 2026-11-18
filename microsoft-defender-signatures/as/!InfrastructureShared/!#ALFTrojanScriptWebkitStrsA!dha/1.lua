-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Script/WebkitStrs.A!dha
-- Type: 24
-- MpAttributes: !SCPT:WebkitStrs.CVE & (Lua:HTMLExt | Lua:JSExt)

local l_0_0 = mp.enum_mpattributesubstring("SCPT:WebkitStrs")
if 3 <= #l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
