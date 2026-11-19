-- Threat: !InfrastructureShared
-- Name: 7fd759abbdd8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if #l_0_1 <= 60 then
  return mp.CLEAN
end
if l_0_1 ~= nil then
  l_0_1 = string.lower(l_0_1)
end
local l_0_2
l_0_2 = {
  "chrome.exe",
  "firefox.exe",
  "edge.exe",
  "brave.exe",
  "opera.exe"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = mp.GetParentProcInfo()
if l_0_3 == nil and l_0_3.image_path == nil then
  return mp.CLEAN
end
local l_0_4 = string.lower(l_0_3.image_path)
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = l_0_4:match("^(.*)\\[^\\]+$")
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = "\\\\appdata\\\\"
local l_0_7 = false
l_0_7, _ = MpCommon.StringRegExpSearch(l_0_6, l_0_5)
if l_0_7 == false then
  return mp.CLEAN
end
return mp.INFECTED
