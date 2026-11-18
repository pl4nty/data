-- Threat: !InfrastructureShared
-- Name: !#TEL:Lua:Linux/MalScripts
-- Type: 13
-- MpAttributes: SCPT:Linux/ShellScript

local l_0_0 = mp.enum_mpattributesubstring("SCPT:Linux/Trojan.mal_attr_")
if 3 <= #l_0_0 then
  return mp.INFECTED
else
  return mp.CLEAN
end
return mp.CLEAN
