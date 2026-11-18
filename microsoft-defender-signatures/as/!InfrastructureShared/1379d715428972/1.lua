-- Threat: !InfrastructureShared
-- Name: 1379d715428972
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = ""
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
if not l_0_4 or #l_0_4 <= 60 then
  return mp.CLEAN
end
if 450 < #l_0_4 then
  return mp.CLEAN
end
local l_0_5 = MpCommon.GetImagePathFromPid(l_0_3)
if not l_0_5 then
  return mp.CLEAN
end
l_0_5 = string.lower(l_0_5)
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
if contains(l_0_5, "powershell.exe") then
  l_0_0 = NormalizeCmdline("powershell", l_0_4)
else
  l_0_0 = NormalizeCmdline("cmd", l_0_4)
end
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = string.gsub(l_0_0, "[\"'`^()+#&]", "")
l_0_0 = string.lower(l_0_0)
local l_0_6, l_0_7 = extract_urls(l_0_0)
if not isnull(l_0_7) then
  return mp.INFECTED
end
return mp.CLEAN
