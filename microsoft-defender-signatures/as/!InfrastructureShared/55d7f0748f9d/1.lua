-- Threat: !InfrastructureShared
-- Name: 55d7f0748f9d
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = sysio.GetFileNameFromProcess(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.match(l_0_1, "[^\\/]+$") ~= "php.exe" then
  return mp.CLEAN
end
local l_0_2 = mp.GetProcessCommandLine(l_0_0)
if not l_0_2 then
  return mp.CLEAN
end
if string.find(string.lower(l_0_2), "get_loaded_extensions", 1, true) then
  return mp.CLEAN
end
local l_0_3 = MpCommon.CommandLineToArgv(l_0_2)
if type(l_0_3) ~= "table" then
  return mp.CLEAN
end
local l_0_4 = false
local l_0_5 = 2
while l_0_5 < #l_0_3 and not l_0_4 do
  if l_0_3[l_0_5] == "--" then
    return mp.CLEAN
  end
  l_0_4 = l_0_3[l_0_5] == "-r"
  l_0_5 = l_0_5 + 1
end
if not l_0_4 then
  return mp.CLEAN
end
local l_0_6 = mp.GetParentProcInfo(l_0_0)
if not (l_0_6 and l_0_6.ppid) or not l_0_6.image_path then
  return mp.CLEAN
end
local l_0_7 = string.lower(l_0_6.image_path)
if string.match(l_0_7, "[^\\/]+$") ~= "cmd.exe" then
  return mp.CLEAN
end
local l_0_8 = mp.GetProcessCommandLine(l_0_6.ppid)
if not l_0_8 then
  return mp.CLEAN
end
local l_0_9 = MpCommon.CommandLineToArgv(l_0_8)
if type(l_0_9) ~= "table" then
  return mp.CLEAN
end
local l_0_10 = false
local l_0_11 = 2
while l_0_11 < #l_0_9 and not l_0_10 do
  local l_0_12 = string.lower(l_0_9[l_0_11])
  if l_0_12 == "/k" or string.sub(l_0_12, 1, 1) ~= "/" then
    return mp.CLEAN
  end
  l_0_10 = l_0_12 == "/c"
  l_0_11 = l_0_11 + 1
end
if not l_0_10 then
  return mp.CLEAN
end
local l_0_13 = mp.GetParentProcInfo(l_0_6.ppid)
if not l_0_13 or not l_0_13.image_path then
  return mp.CLEAN
end
local l_0_14 = string.lower(l_0_13.image_path)
if string.match(l_0_14, "[^\\/]+$") ~= "httpd.exe" then
  return mp.CLEAN
end
local l_0_15 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_0)
if not l_0_15 or not l_0_15.IntegrityLevel then
  return mp.CLEAN
end
if l_0_15.IntegrityLevel ~= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.CLEAN
end
return mp.INFECTED
