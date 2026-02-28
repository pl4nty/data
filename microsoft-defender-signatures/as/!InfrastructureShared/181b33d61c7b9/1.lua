local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = L0_1.ppid
  L3_1 = "T1003.001"
  L4_1 = "credentialdumping_concrete"
  L5_1 = 86400
  L1_1(L2_1, L3_1, L4_1, L5_1)
end
L1_1 = sms_untrusted_process
L1_1()
L1_1 = add_parents
L1_1()
L1_1 = pcall
L2_1 = reportBmInfo
L1_1, L2_1 = L1_1(L2_1)
if not L1_1 and L2_1 then
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "bmInfoFailReason"
  L5_1 = tostring
  L6_1 = L2_1
  L5_1 = L5_1(L6_1)
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
