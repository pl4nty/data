-- Threat: !InfrastructureShared
-- Name: 153b3a43f86da
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = MpCommon.PathToWin32Path(bm.get_imagepath())
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if checkFileLastWriteTime(l_0_0, 120) ~= false then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) == true then
  return mp.CLEAN
end
return mp.INFECTED
