-- Threat: !InfrastructureShared
-- Name: 4cb33c131671
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and l_0_0.integrity_level < MpCommon.SECURITY_MANDATORY_HIGH_RID then
  local l_0_1 = bm.get_imagepath()
  if l_0_1 then
    l_0_1 = MpCommon.PathToWin32Path(l_0_1)
    if l_0_1 and not mp.IsKnownFriendlyFile(l_0_1, false, false) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
