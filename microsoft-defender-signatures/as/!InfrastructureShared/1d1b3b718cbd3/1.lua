-- Threat: !InfrastructureShared
-- Name: 1d1b3b718cbd3
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info().ppid
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = l_0_1:match("[wc]script%.exe\"?%s+\"([^\"]+)\"") or l_0_1:match("[wc]script%.exe\"?%s+([^%s\"]+%.%a+)")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_2:match("^(.*)\\[^\\]+$")
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4
if string.find(l_0_3, "\\temp\\%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x_.+%.zip%.") ~= nil or string.find(l_0_3, "\\temp\\temp[0-9]_.+%.zip$") ~= nil then
  l_0_4 = "explorer"
elseif string.find(l_0_3, "\\7z", 1, true) then
  if string.find(l_0_3, "\\appdata\\local\\temp\\7z", 1, true) or string.match(l_0_3, "\\temp\\7z[%x]+$") then
    l_0_4 = "7zip"
  end
elseif string.find(l_0_3, "\\rar$", 1, true) then
  if string.find(l_0_3, "\\appdata\\local\\temp\\rar$", 1, true) or string.match(l_0_3, "\\rar%$.*%.rartemp$") then
    l_0_4 = "winrar"
  end
elseif string.find(l_0_3, "\\appdata\\local\\temp\\winzip", 1, true) then
  l_0_4 = "winzip"
end
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = l_0_2:match("%.([^%.\\]+)$")
if l_0_5 == nil then
  return mp.CLEAN
end
local l_0_6 = "BM:ScriptInZipUserExecution.A!" .. l_0_5
TrackPidAndTechniqueBM("BM", "T1204", "BM:ScriptInZipUserExecution.A")
if l_0_6 ~= nil then
  bm.trigger_sig(l_0_6, l_0_2)
  MpCommon.AddProcessAttribute(l_0_0, "BM:ScriptInZipUserExecution.A", l_0_6, true)
  MpCommon.AddProcessAttribute(l_0_0, "BM:ScriptInZipUserExecutionArchive.A!" .. l_0_4, l_0_6, true)
  MpCommon.AddProcessAttribute(l_0_0, l_0_6, l_0_4, true)
end
return mp.INFECTED
