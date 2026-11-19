-- Threat: !InfrastructureShared
-- Name: 4bab3c4f91483
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil and this_sigattrlog[4].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil and this_sigattrlog[5].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil and this_sigattrlog[8].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil and this_sigattrlog[9].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[9].utf8p1
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  bm.add_threat_file(l_0_0)
end
local l_0_1 = bm.get_imagepath()
if (SuspMacPathsToMonitor(l_0_1, true) or string.find(l_0_1, "/Users/[^/]+/Downloads/", 1, false) or string.find(l_0_1, "/Users/[^/]+/Documents/", 1, false) or string.find(l_0_1, "/Users/[^/]+/Desktop/", 1, false)) and sysio.IsFileExists(l_0_1) then
  bm.add_threat_file(l_0_1)
end
return mp.INFECTED
