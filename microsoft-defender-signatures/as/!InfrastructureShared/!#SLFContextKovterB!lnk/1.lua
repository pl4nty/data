local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    goto lbl_37
  end
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_NEWLYCREATEDHINT
L1_1 = L1_1(L2_1)
if L1_1 == true then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_PROCESS_PPID
  L1_1 = L1_1(L2_1)
  if L1_1 ~= nil then
    L2_1 = MpCommon
    L2_1 = L2_1.RequestSmsOnProcess
    L3_1 = L1_1
    L4_1 = MpCommon
    L4_1 = L4_1.SMS_SCAN_MED
    L2_1(L3_1, L4_1)
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
::lbl_37::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
