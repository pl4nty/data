local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = MpCommon
L0_1 = L0_1.GetPersistContextNoPath
L1_1 = "vssamsipid"
L0_1 = L0_1(L1_1)
L1_1 = ipairs
L2_1 = L0_1
L1_1, L2_1, L3_1 = L1_1(L2_1)
for L4_1, L5_1 in L1_1, L2_1, L3_1 do
  L6_1 = sms_untrusted_process_pid
  L7_1 = L5_1
  L6_1(L7_1)
  L6_1 = add_parents
  L7_1 = L5_1
  L6_1(L7_1)
  L6_1 = reportSessionInformation
  L6_1()
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
