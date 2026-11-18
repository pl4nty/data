-- Threat: !InfrastructureShared
-- Name: 15b32dffbbcf
-- Type: 21

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
local l_0_1 = MpCommon.QueryPersistContext(l_0_0, "NewPECreatedNoCert")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = sysio.GetFileLastWriteTime(l_0_0)
if sysio.GetLastResult().Success and l_0_2 ~= 0 then
  l_0_2 = l_0_2 / 10000000 - 11644473600
  local l_0_3 = MpCommon.GetCurrentTimeT()
  if l_0_2 > l_0_3 or 600 < l_0_3 - l_0_2 then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
