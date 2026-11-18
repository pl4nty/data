-- Threat: !InfrastructureShared
-- Name: 1dad75d344350
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 == nil or l_0_1.image_path == nil then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1.image_path)
if l_0_2:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_3 = mp.GetScannedPPID()
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = mp.GetProcessCommandLine(l_0_3)
if not l_0_4 then
  return mp.CLEAN
end
if #l_0_4 < 50 then
  return mp.CLEAN
end
local l_0_5 = MpCommon.GetImagePathFromPid(l_0_3)
if not l_0_5 then
  return mp.CLEAN
end
if not contains(l_0_5, {
  "powershell.exe",
  "cmd.exe",
  "mshta.exe",
  "curl.exe",
  "msiexec.exe",
  "conhost.exe"
}) then
  return mp.CLEAN
end
if contains(l_0_5, "powershell.exe") or contains(l_0_4, "powershell") then
  l_0_0 = NormalizeCmdline("powershell", l_0_4)
else
  l_0_0 = NormalizeCmdline("cmd", l_0_4)
end
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = string.gsub(l_0_0, "[\"'()+]", "")
l_0_0 = string.lower(l_0_0)
local l_0_6, l_0_7 = MpCommon.StringRegExpSearch("(ht?tps?:\\/\\/[^^\\s\\x22\\x27\\x7C\\x29\\x3B\\x3E\\x3C\\x2C\\x5E\\x60\\x5D\\x7D]+)", l_0_0)
if not l_0_6 then
  return mp.CLEAN
end
if not l_0_7 then
  return mp.CLEAN
end
local l_0_8 = ExtractPartsFromUri(l_0_7)
if l_0_8 == "" or l_0_8 == nil then
  return mp.CLEAN
end
if l_0_8.host == "" or l_0_8.host == nil then
  return mp.CLEAN
end
local l_0_9 = split(l_0_8.host, "%.")
if not l_0_9 then
  return mp.CLEAN
end
local l_0_10 = "." .. tostring(l_0_9[#l_0_9])
if not l_0_10 then
  return mp.CLEAN
end
if l_0_10 == ".ru" then
  return mp.LOWFI
end
if isSuspTLD(l_0_10) then
  return mp.INFECTED
end
return mp.CLEAN
