-- Threat: !InfrastructureShared
-- Name: 10fd70c1da57e
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetImagePathFromPid(l_0_0)
if l_0_1 == nil or #l_0_1 < 25 then
  return mp.CLEAN
end
local l_0_2 = MpCommon.PathToWin32Path(l_0_1)
if l_0_2 == nil or #l_0_2 < 25 then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
local l_0_3, l_0_4 = string.match(l_0_2, "^(.*)\\([^\\]+)$")
if l_0_3 == nil or l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = string.lower(MpCommon.ExpandEnvironmentVariables("%windir%") .. "\\system32")
if l_0_3 ~= l_0_5 then
  return mp.CLEAN
end
local l_0_6 = {
  ["utilman.exe"] = true,
  ["sethc.exe"] = true,
  ["osk.exe"] = true,
  ["magnify.exe"] = true,
  ["narrator.exe"] = true,
  ["displayswitch.exe"] = true,
  ["atbroker.exe"] = true
}
if l_0_6[l_0_4] == nil then
  return mp.CLEAN
end
local l_0_7 = sysio.GetPEVersionInfo(l_0_2)
local l_0_8 = l_0_7 and l_0_7.OriginalFilename
if l_0_8 ~= nil and string.lower(l_0_8) == "cmd.exe" then
  return mp.INFECTED
end
return mp.CLEAN
