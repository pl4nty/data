-- Threat: !InfrastructureShared
-- Name: 217b32b0d8ce4
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p2
end
local l_0_1 = {
  "OpenHardwareMonitor",
  "pcadmin",
  "finereader",
  "Microsoft\\DRM"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
return mp.INFECTED
