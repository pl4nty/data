-- Threat: !InfrastructureShared
-- Name: 4dd7c2256929
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if l_0_1:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_2 = mp.GetScannedPPID()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
local l_0_4 = MpCommon.GetImagePathFromPid(l_0_2)
l_0_3 = string.lower(l_0_3)
if not l_0_4 and not l_0_3 then
  return mp.CLEAN
end
if not contains(l_0_4, {
  "powershell.exe",
  "cmd.exe"
}) then
  return mp.CLEAN
end
l_0_3 = string.gsub(l_0_3, "[\"'()+]", "")
if not containsall(l_0_3, {"powershell", "curl"}) then
  return mp.CLEAN
end
if not contains(l_0_3, {
  "powershell -",
  "iex",
  "iwr"
}) then
  return mp.CLEAN
end
return mp.INFECTED
