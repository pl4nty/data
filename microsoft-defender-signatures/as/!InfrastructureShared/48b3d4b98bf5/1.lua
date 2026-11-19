-- Threat: !InfrastructureShared
-- Name: 48b3d4b98bf5
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = extractDllForRegproc(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_1) and mp.IsKnownFriendlyFile(l_0_1, true, false) == false then
  bm.add_threat_file(l_0_1)
end
return mp.INFECTED
