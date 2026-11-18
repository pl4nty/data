-- Threat: !InfrastructureShared
-- Name: 284b3f4b46e5e
-- Type: 21
-- Includes: BMLuaLib

if not this_sigattrlog[2].matched or this_sigattrlog[2].utf8p1 == nil or this_sigattrlog[2].utf8p1 == "" or this_sigattrlog[2].utf8p2 == nil or this_sigattrlog[2].utf8p2 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(this_sigattrlog[2].utf8p2) or IsExcludedByImagePathMacOS(this_sigattrlog[2].utf8p1) then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[2].utf8p1
if sysio.IsFileExists(l_0_0) then
  bm.add_threat_file(l_0_0)
end
return mp.INFECTED
