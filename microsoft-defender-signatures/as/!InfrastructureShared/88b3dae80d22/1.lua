-- Threat: !InfrastructureShared
-- Name: 88b3dae80d22
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if not this_sigattrlog[1].matched or this_sigattrlog[1].utf8p1 == nil or this_sigattrlog[1].utf8p1 == "" or this_sigattrlog[1].utf8p2 == nil or this_sigattrlog[1].utf8p2 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(this_sigattrlog[1].utf8p2) or IsExcludedByImagePathMacOS(this_sigattrlog[1].utf8p1) then
  return mp.CLEAN
end
l_0_0 = this_sigattrlog[1].utf8p1
if sysio.IsFileExists(l_0_0) then
  bm.add_threat_file(l_0_0)
end
return mp.INFECTED
