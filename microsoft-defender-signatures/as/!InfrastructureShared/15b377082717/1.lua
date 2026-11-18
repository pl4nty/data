-- Threat: !InfrastructureShared
-- Name: 15b377082717
-- Type: 21

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
local l_0_1 = sysio.GetFileLastWriteTime(l_0_0)
if sysio.GetLastResult().Success and l_0_1 ~= 0 then
  l_0_1 = l_0_1 / 10000000 - 11644473600
  local l_0_2 = MpCommon.GetCurrentTimeT()
  if l_0_1 > l_0_2 or 60 < l_0_2 - l_0_1 then
    return mp.CLEAN
  end
end
return mp.INFECTED
