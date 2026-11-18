-- Threat: !InfrastructureShared
-- Name: 41d75c41fd00
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
local l_0_2 = MpCommon.GetImagePathFromPid(l_0_0)
l_0_1 = string.lower(l_0_1)
if not l_0_2 and not l_0_1 then
  return mp.CLEAN
end
if not contains(l_0_2, {
  "powershell.exe",
  "cmd.exe"
}) then
  return mp.CLEAN
end
l_0_1 = string.gsub(l_0_1, "[\"'()+]", "")
if not StringEndsWith(l_0_1, "|iex") then
  return mp.CLEAN
end
return mp.INFECTED
