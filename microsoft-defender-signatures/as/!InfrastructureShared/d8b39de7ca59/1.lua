-- Threat: !InfrastructureShared
-- Name: d8b39de7ca59
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if not l_0_0 then
  return mp.CLEAN
end
if contains(l_0_0, "&") and (contains(l_0_0, "powershell") or contains(l_0_0, "cmd.exe") or contains(l_0_0, "wscript") or contains(l_0_0, "mshta") or contains(l_0_0, "jscript") or contains(l_0_0, "wmic") or contains(l_0_0, "rundll32") or contains(l_0_0, "regsvr32")) then
  bm_AddRelatedFileFromCommandLine(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
