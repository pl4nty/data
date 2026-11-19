-- Threat: !InfrastructureShared
-- Name: 32b3ae9b513f
-- Type: 21
-- Includes: HvaLookupHelpers

if IsDeviceHVA() then
  local l_0_0 = ExtractDeviceProperties()
  if l_0_0.DeviceRoles.DomainController ~= nil then
    local l_0_1 = false
    local l_0_2 = bm.get_current_process_startup_info()
    _, l_0_1 = pcall(MpCommon.QuerySessionInformation, l_0_2.ppid, MpCommon.WTSIsRemoteSession)
    if l_0_1 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
