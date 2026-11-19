-- Threat: !InfrastructureShared
-- Name: 63d73885608a
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 then
  local l_0_1 = sysio.GetFileLastWriteTime(l_0_0.image_path)
  if sysio.GetLastResult().Success and l_0_1 ~= 0 then
    l_0_1 = l_0_1 / 10000000 - 11644473600
    local l_0_2 = MpCommon.GetCurrentTimeT()
    if l_0_2 - l_0_1 < 120 and not mp.IsKnownFriendlyFile(l_0_0.image_path, false, false) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
