-- Threat: !InfrastructureShared
-- Name: 33b3da6ddcdb
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
local l_0_1 = string.lower(MpCommon.PathToWin32Path(l_0_0))
local l_0_2 = sysio.GetFileSize(l_0_1)
if 716800 < l_0_2 or l_0_2 < 307200 then
  return mp.CLEAN
end
return mp.INFECTED
