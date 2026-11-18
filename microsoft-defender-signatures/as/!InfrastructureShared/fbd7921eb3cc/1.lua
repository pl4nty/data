-- Threat: !InfrastructureShared
-- Name: fbd7921eb3cc
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  if l_0_0.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0.ppid, true) then
    local l_0_1 = mp.GetScannedPPID()
    if l_0_1 then
      MpCommon.RequestSmsOnProcess(l_0_1, MpCommon.SMS_SCAN_HIGH)
      mp.AddDeferredBMAction("SmsAsyncScanEvent", 1000)
    end
    return mp.INFECTED
  end
  local l_0_2 = mp.GetParentProcInfo(l_0_0.ppid)
  if l_0_2 ~= nil and l_0_2.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_2.ppid, true) then
    local l_0_3 = mp.GetScannedPPID()
    if l_0_3 then
      MpCommon.RequestSmsOnProcess(l_0_3, MpCommon.SMS_SCAN_HIGH)
      mp.AddDeferredBMAction("SmsAsyncScanEvent", 1000)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
