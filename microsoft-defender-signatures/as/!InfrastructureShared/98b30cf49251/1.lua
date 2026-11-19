-- Threat: !InfrastructureShared
-- Name: 98b30cf49251
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
local l_0_1 = string.lower(MpCommon.PathToWin32Path(l_0_0))
local l_0_2 = sysio.GetFileSize(l_0_1)
if l_0_2 < 6291456 or 8388608 < l_0_2 then
  return mp.CLEAN
end
return mp.INFECTED
