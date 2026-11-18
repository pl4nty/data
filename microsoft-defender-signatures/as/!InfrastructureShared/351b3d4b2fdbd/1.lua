-- Threat: !InfrastructureShared
-- Name: 351b3d4b2fdbd
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[14].matched and this_sigattrlog[14].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[14].utf8p1
elseif this_sigattrlog[15].matched and this_sigattrlog[15].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[15].utf8p1
elseif this_sigattrlog[16].matched and this_sigattrlog[16].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[16].utf8p1
elseif this_sigattrlog[17].matched and this_sigattrlog[17].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[17].utf8p1
end
if l_0_1 then
  bm.add_related_file(l_0_1)
end
return mp.INFECTED
