-- Threat: !InfrastructureShared
-- Name: 75b384c4e42e
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 ~= nil and l_0_1.ppid ~= nil then
  l_0_0 = l_0_1.ppid
end
local l_0_2 = bm.get_imagepath()
if l_0_2 ~= nil then
  l_0_2 = MpCommon.PathToWin32Path(l_0_2)
end
if l_0_2 == nil or l_0_0 == nil then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if l_0_2:find("microsoft\\onedrive\\", 1, true) or l_0_2:find("windows\\ccm", 1, true) then
  return mp.CLEAN
end
if l_0_2:find("windows\\fortiemsinstaller", 1, true) then
  return mp.CLEAN
end
if IsDetectionThresholdMet(l_0_0) then
  TrackPidAndTechniqueBM(l_0_0, "T1053.005", "tt_remediate_cantidate")
  return mp.INFECTED
end
return mp.CLEAN
