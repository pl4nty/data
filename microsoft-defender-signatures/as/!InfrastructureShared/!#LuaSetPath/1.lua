local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 == L1_1 then
  L0_1 = pe
  L0_1 = L0_1.get_exports
  L0_1, L1_1 = L0_1()
  L2_1 = 1
  L3_1 = L0_1
  L4_1 = 1
  for L5_1 = L2_1, L3_1, L4_1 do
    L6_1 = L1_1[L5_1]
    L6_1 = L6_1.fn
    if L6_1 == 2934435936 then
      L6_1 = mp
      L6_1 = L6_1.get_contextdata
      L7_1 = mp
      L7_1 = L7_1.CONTEXT_DATA_PROCESS_PPID
      L6_1 = L6_1(L7_1)
      if L6_1 then
        L7_1 = MpCommon
        L7_1 = L7_1.RequestSmsOnProcess
        L8_1 = L6_1
        L9_1 = MpCommon
        L9_1 = L9_1.SMS_SCAN_MED
        L7_1(L8_1, L9_1)
        L7_1 = mp
        L7_1 = L7_1.INFECTED
        return L7_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
