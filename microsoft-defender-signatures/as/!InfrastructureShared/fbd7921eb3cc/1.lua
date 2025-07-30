-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\fbd7921eb3cc\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  do
    if l_0_0.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0.ppid, true) then
      local l_0_1 = (mp.GetScannedPPID)()
      if l_0_1 then
        (MpCommon.RequestSmsOnProcess)(l_0_1, MpCommon.SMS_SCAN_HIGH)
        ;
        (mp.AddDeferredBMAction)("SmsAsyncScanEvent", 1000)
      end
      return mp.INFECTED
    end
    local l_0_2 = (mp.GetParentProcInfo)(l_0_0.ppid)
    do
      if l_0_2 ~= nil and l_0_2.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_2.ppid, true) then
        local l_0_3 = (mp.GetScannedPPID)()
        if l_0_3 then
          (MpCommon.RequestSmsOnProcess)(l_0_3, MpCommon.SMS_SCAN_HIGH)
          ;
          (mp.AddDeferredBMAction)("SmsAsyncScanEvent", 1000)
        end
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

