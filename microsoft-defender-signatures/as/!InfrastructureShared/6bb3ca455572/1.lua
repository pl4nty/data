local L0_1, L1_1, L2_1, L3_1
L0_1 = ""
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L0_1 = L1_1.utf8p1
end
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.ReportLowfi
L2_1 = L0_1
L3_1 = 2623644159
L1_1(L2_1, L3_1)
L1_1 = bm
L1_1 = L1_1.add_related_file
L2_1 = L0_1
L1_1(L2_1)
L1_1 = bm
L1_1 = L1_1.trigger_sig
L2_1 = "CymulatePayloadFile"
L3_1 = L0_1
L1_1(L2_1, L3_1)
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
