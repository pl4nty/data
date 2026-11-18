-- Threat: !InfrastructureShared
-- Name: 1c4b325628ee3
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1]
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2]
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3]
else
  return mp.CLEAN
end
local l_0_1 = MpCommon.ExpandEnvironmentVariables("%WINDIR%")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = sysio.GetFileFsVolumeInformation(l_0_1)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = l_0_0.utf8p1:sub(-8)
local l_0_4 = string.format("%x", l_0_2.VolumeSerialNumber)
if l_0_3 == l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
