local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 then
    L1_1 = IsKeyInRollingQueue
    L2_1 = "IsProcessChainViaRUNMRU"
    L3_1 = L0_1.ppid
    L4_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1)
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.GetScannedPPID
      L1_1 = L1_1()
      if L1_1 then
        L2_1 = MpCommon
        L2_1 = L2_1.RequestSmsOnProcess
        L3_1 = L1_1
        L4_1 = MpCommon
        L4_1 = L4_1.SMS_SCAN_HIGH
        L2_1(L3_1, L4_1)
        L2_1 = mp
        L2_1 = L2_1.AddDeferredBMAction
        L3_1 = "SmsAsyncScanEvent"
        L4_1 = 1000
        L2_1(L3_1, L4_1)
      end
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
  end
  L1_1 = mp
  L1_1 = L1_1.GetParentProcInfo
  L2_1 = L0_1.ppid
  L1_1 = L1_1(L2_1)
  if L1_1 ~= nil then
    L2_1 = L1_1.ppid
    if L2_1 then
      L2_1 = IsKeyInRollingQueue
      L3_1 = "IsProcessChainViaRUNMRU"
      L4_1 = L1_1.ppid
      L5_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1)
      if L2_1 then
        L2_1 = mp
        L2_1 = L2_1.GetScannedPPID
        L2_1 = L2_1()
        if L2_1 then
          L3_1 = MpCommon
          L3_1 = L3_1.RequestSmsOnProcess
          L4_1 = L2_1
          L5_1 = MpCommon
          L5_1 = L5_1.SMS_SCAN_HIGH
          L3_1(L4_1, L5_1)
          L3_1 = mp
          L3_1 = L3_1.AddDeferredBMAction
          L4_1 = "SmsAsyncScanEvent"
          L5_1 = 1000
          L3_1(L4_1, L5_1)
        end
        L3_1 = mp
        L3_1 = L3_1.INFECTED
        return L3_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
