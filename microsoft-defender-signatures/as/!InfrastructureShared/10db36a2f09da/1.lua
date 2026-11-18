-- Threat: !InfrastructureShared
-- Name: 10db36a2f09da
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
l_0_0 = string.lower(l_0_0)
if checkFileLastWriteTime(l_0_0, 120) ~= false then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) == true then
  return mp.CLEAN
end
return mp.INFECTED
