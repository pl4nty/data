-- Threat: !InfrastructureShared
-- Name: 41b3047a9ff3
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if not string.find(l_0_0, "^c:\\") and not string.find(l_0_0, "^\\\\") then
  return mp.CLEAN
end
if l_0_0 and string.find(l_0_0, "\\program files", 1, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1071", "command_control_s")
return mp.INFECTED
