-- Threat: !InfrastructureShared
-- Name: 368d73f84a90c
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
if not l_0_3 then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
if #l_0_3 < 50 then
  return mp.CLEAN
end
if 450 < #l_0_3 then
  return mp.CLEAN
end
local l_0_4 = MpCommon.GetImagePathFromPid(l_0_2)
if not l_0_4 then
  return mp.CLEAN
end
l_0_4 = string.lower(l_0_4)
if not contains(l_0_4, {
  "powershell.exe",
  "cmd.exe",
  "conhost.exe"
}) then
  return mp.CLEAN
end
if contains(l_0_4, {
  "powershell.exe"
}) then
  local l_0_5, l_0_6 = MpCommon.StringRegExpSearch("(?i)[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|m[inimized]*)\\s+", l_0_3)
  if l_0_5 then
    return mp.INFECTED
  end
end
return mp.INFECTED
