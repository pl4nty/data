-- Threat: !InfrastructureShared
-- Name: adb31b65cb31
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
  mp.ReportLowfi(l_0_0, 1131483480)
end
add_parents()
return mp.INFECTED
