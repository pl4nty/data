-- Threat: !InfrastructureShared
-- Name: c8d7813cba01
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
local l_0_2 = {
  "chrome.exe",
  "firefox.exe",
  "edge.exe",
  "brave.exe",
  "opera.exe"
}
local l_0_3 = mp.GetProcessCommandLine(l_0_0.ppid)
local l_0_4 = {
  "--utility-sub-type=chrome.mojom.utilwin"
}
if l_0_3 == nil then
  return mp.CLEAN
end
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
if not contains(l_0_3, l_0_4) then
  return mp.CLEAN
end
return mp.INFECTED
