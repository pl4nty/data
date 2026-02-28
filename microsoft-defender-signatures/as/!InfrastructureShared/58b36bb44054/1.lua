local L0_1, L1_1, L2_1, L3_1
L0_1 = sms_untrusted_process
L0_1()
L0_1 = reportSessionInformation
L0_1()
L0_1 = reportTimingData
L0_1()
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = bm
  L0_1 = L0_1.add_related_string
  L1_1 = "NamedPipeImpersonation"
  L2_1 = safeJsonSerialize
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L2_1 = L2_1(L3_1)
  L3_1 = bm
  L3_1 = L3_1.RelatedStringBMReport
  L0_1(L1_1, L2_1, L3_1)
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
