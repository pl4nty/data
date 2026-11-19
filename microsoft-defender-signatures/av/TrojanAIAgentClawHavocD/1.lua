-- Threat: Trojan:AIAgent/ClawHavoc.D
-- Type: 13
-- MpAttributes: SCPT:Claw_BadRedirct.A

if not mp.get_mpattribute("Lua:FnameAttr!skill.md") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0:find("[\\/]%.openclaw[\\/]") then
  return mp.CLEAN
end
if not l_0_0:find("[\\/]skills[\\/]") then
  return mp.CLEAN
end
return mp.INFECTED
