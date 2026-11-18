-- Threat: !InfrastructureShared
-- Name: !#Lua:FileFromMountedDrive
-- Type: 12
-- MpAttributes: RPF:TopLevelFile & MpOnOpenRtpScan

local l_0_0 = string.lower(mp.getfilename())
if l_0_0 == nil or string.len(l_0_0) < 4 then
  return mp.CLEAN
end
local l_0_1 = string.sub(l_0_0, -4)
if l_0_1 ~= ".lnk" then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
local l_0_2 = MpCommon.GetMountedFileBackingFilePath(l_0_0)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3, l_0_4 = mp.GetMotwZoneForFile(l_0_2)
if l_0_4 ~= nil and 3 <= l_0_4 then
  mp.set_mpattribute("Lua:LnkFromMountedVolumeWithMotw")
  l_0_1 = string.lower(string.sub(l_0_2, -4))
  if l_0_1 == ".iso" then
    mp.set_mpattribute("Lua:LnkFromMountedIsoWithMotw")
  end
end
return mp.INFECTED
