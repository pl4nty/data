-- Threat: !InfrastructureShared
-- Name: 25b36c1e002c
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = {
  ["explorer.exe"] = true,
  ["outlook.exe"] = true,
  ["winword.exe"] = true,
  ["excel.exe"] = true,
  ["msedge.exe"] = true,
  ["chrome.exe"] = true,
  ["firefox.exe"] = true,
  ["winrar.exe"] = true,
  ["winzip.exe"] = true,
  ["7zfm.exe"] = true,
  ["olk.exe"] = true
}
if checkParentProcessNameFromListByPPID(l_0_0.ppid, l_0_1) ~= true then
  return mp.CLEAN
end
AddResearchData(l_0_0.ppid, true)
return mp.INFECTED
