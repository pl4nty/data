-- Threat: !InfrastructureShared
-- Name: 25b34ba1dd04
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2 ~= nil and l_0_2.command_line ~= nil and l_0_2.ppid ~= nil then
  l_0_1 = string.lower(l_0_2.command_line)
  l_0_0 = l_0_2.ppid
end
local l_0_3 = bm.get_imagepath()
if l_0_3 ~= nil then
  l_0_3 = MpCommon.PathToWin32Path(l_0_3)
end
if l_0_3 == nil or l_0_0 == nil then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
if StringStartsWith(l_0_3, "%") then
  return mp.CLEAN
end
if l_0_3:find("\\adminarsenal\\", 1, true) or l_0_3:find("ccmexec%.exe") or l_0_3:find("bomgar%-scc%.exe") or l_0_3:find("keyacc32%.exe") then
  return mp.CLEAN
end
if l_0_3:find("\\temp\\kav remote installations\\", 1, true) or l_0_3:find("\\logmein rescue connectonlan\\lmirescueapplet", 1, true) then
  return mp.CLEAN
end
if l_0_3:find("\\veeam.+%.exe") or l_0_3:find("\\f5.+%.exe") then
  return mp.CLEAN
end
if l_0_3:find("\\pdq.+%.exe") then
  return mp.CLEAN
end
if l_0_1:find("advanced threat protection\\datacollection\\", 1, true) then
  return mp.CLEAN
end
local l_0_4 = GetTaintLevelHR()
if l_0_4 == "High" and (mp.IsHipsRuleEnabled("01443614-cd74-433a-b99e-2ecdc07bfc25") or mp.IsHipsRuleEnabled("c1db55ab-c21a-4637-bb3f-a12568109d35")) then
  TrackPidAndTechniqueBM(l_0_0, "T1021.002", "tt_remediate_cantidate")
  return mp.INFECTED
end
return mp.CLEAN
