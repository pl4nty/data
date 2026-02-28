local L0_1, L1_1, L2_1, L3_1
L0_1 = MpCommon
L0_1 = L0_1.RollingQueueCount
L1_1 = "TamperingAlerts"
L0_1 = L0_1(L1_1)
if L0_1 ~= nil and 2 <= L0_1 then
  L1_1 = sms_untrusted_process
  L1_1()
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    if L2_1 then
      L2_1 = reportGenericRansomware
      L3_1 = this_sigattrlog
      L3_1 = L3_1[1]
      L3_1 = L3_1.utf8p2
      L2_1 = L2_1(L3_1)
      L1_1 = L2_1
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L2_1 = L2_1.utf8p2
      if L2_1 then
        L2_1 = reportGenericRansomware
        L3_1 = this_sigattrlog
        L3_1 = L3_1[2]
        L3_1 = L3_1.utf8p2
        L2_1 = L2_1(L3_1)
        L1_1 = L2_1
      end
    end
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  if L1_1 == L2_1 then
    L2_1 = reportTimingData
    L2_1()
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
