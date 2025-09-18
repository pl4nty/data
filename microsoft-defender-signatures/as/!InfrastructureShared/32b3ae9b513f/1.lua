-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3ae9b513f\1.luac 

-- params : ...
-- function num : 0
if IsDeviceHVA() then
  local l_0_0 = ExtractDeviceProperties()
  if (l_0_0.DeviceRoles).DomainController ~= nil then
    local l_0_1 = false
    _ = pcall(MpCommon.QuerySessionInformation, ((bm.get_current_process_startup_info)()).ppid, MpCommon.WTSIsRemoteSession)
    if l_0_1 and MpCommon.WTSClientProtocolType == 2 then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

