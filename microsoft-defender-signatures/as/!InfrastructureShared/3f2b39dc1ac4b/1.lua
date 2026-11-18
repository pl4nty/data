-- Threat: !InfrastructureShared
-- Name: 3f2b39dc1ac4b
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
local l_0_1 = string.lower(MpCommon.PathToWin32Path(l_0_0))
if not sysio.IsFileExists(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = sysio.GetFileSize(l_0_1)
if 262144000 < l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
