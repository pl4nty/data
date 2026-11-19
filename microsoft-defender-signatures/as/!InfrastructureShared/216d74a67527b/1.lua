-- Threat: !InfrastructureShared
-- Name: 216d74a67527b
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = GetRealPidForScenario("CMDHSTR")
if IsPidExcluded(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 ~= nil then
  local l_0_2 = string.lower(l_0_1.image_path)
  if 54 < #l_0_2 and l_0_2:find("microsoft.office.datacenter.torus.powershellworker.exe$") then
    return mp.CLEAN
  end
end
local l_0_3 = sysio.GetFileLastWriteTime(l_0_1.image_path)
l_0_3 = l_0_3 / 10000000 - 11644473600
local l_0_4 = MpCommon.GetCurrentTimeT()
if l_0_4 - l_0_3 < 172800 and not mp.IsKnownFriendlyFile(l_0_1.image_path, false, false) then
  return mp.INFECTED
end
local l_0_5 = mp.GetParentProcInfo(l_0_1.ppid)
local l_0_6 = sysio.GetFileLastWriteTime(l_0_5.image_path)
l_0_6 = l_0_6 / 10000000 - 11644473600
if l_0_4 - l_0_6 < 172800 and not mp.IsKnownFriendlyFile(l_0_5.image_path, false, false) then
  return mp.INFECTED
end
return mp.CLEAN
