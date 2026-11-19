-- Threat: !InfrastructureShared
-- Name: 15b3ebda6751
-- Type: 21

local l_0_0 = MpCommon.PathToWin32Path(bm.get_imagepath())
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = bm.get_connection_string()
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = tonumber(string.match(l_0_2, "DestPort=(%d+);"))
if l_0_3 < 10050 or 10063 < l_0_3 then
  return mp.CLEAN
end
local l_0_4, l_0_5, l_0_6 = l_0_1:match("(.+\\)([^\\]+)(%.%l%l%l)$")
if l_0_4 == nil then
  return mp.CLEAN
end
if l_0_5 == nil then
  return mp.CLEAN
end
if l_0_6 == nil or l_0_6 ~= ".exe" then
  return mp.CLEAN
end
local l_0_7 = string.lower(MpCommon.ExpandEnvironmentVariables("%WINDIR%\\SYSTEM32\\"))
local l_0_8 = string.lower(MpCommon.ExpandEnvironmentVariables("%WINDIR%\\SYSWOW64\\"))
local l_0_9 = string.lower(MpCommon.ExpandEnvironmentVariables("%WINDIR%\\"))
if l_0_7 and l_0_7 == l_0_4 or l_0_8 and l_0_8 == l_0_4 or l_0_9 and l_0_9 == l_0_4 then
  return mp.INFECTED
end
return mp.CLEAN
