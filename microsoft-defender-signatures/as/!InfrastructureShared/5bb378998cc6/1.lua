-- Threat: !InfrastructureShared
-- Name: 5bb378998cc6
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = string.lower(MpCommon.ExpandEnvironmentVariables("%WINDIR%\\SYSTEM32\\"))
if not l_0_0:find(l_0_1, 1, true) then
  return mp.CLEAN
end
local l_0_2 = versioning.GetOsBuildNumber()
local l_0_3 = versioning.GetOsBuildMin()
if l_0_2 < 19044 then
  return mp.CLEAN
end
if l_0_2 == 19044 and l_0_3 < 1826 then
  return mp.CLEAN
end
local l_0_4 = sysio.GetPEFixedVersionInfo(l_0_0)
local l_0_5 = l_0_4.FileVersion
local l_0_6 = crypto.shr64(l_0_5, 48)
local l_0_7 = crypto.bitand(crypto.shr64(l_0_5, 32), 65535)
local l_0_8 = crypto.bitand(crypto.shr64(l_0_5, 16), 65535)
local l_0_9 = crypto.bitand(l_0_5, 65535)
if 10 <= l_0_6 and 0 <= l_0_7 and 19044 < l_0_8 then
  return mp.CLEAN
end
if 10 <= l_0_6 and 0 <= l_0_7 and l_0_8 == 19044 and 1826 <= l_0_9 then
  return mp.CLEAN
end
local l_0_10 = sysio.GetPEVersionInfo(l_0_0)
if not l_0_10 then
  return mp.CLEAN
end
local l_0_11 = l_0_10.OriginalFilename
if not l_0_11 or l_0_11 ~= "ntdll.dll" then
  return mp.CLEAN
end
local l_0_12 = tostring(l_0_6) .. "." .. tostring(l_0_7) .. "." .. tostring(l_0_8) .. "." .. tostring(l_0_9)
bm.add_related_string("NTDLL version", l_0_12, bm.RelatedStringBMReport)
return mp.INFECTED
