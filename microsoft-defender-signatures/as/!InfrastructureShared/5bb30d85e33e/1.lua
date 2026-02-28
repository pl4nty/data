local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = RansomwareFeatures
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = type
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 == "table" then
    L1_1 = #L0_1
    if L1_1 == 7 then
      goto lbl_16
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_16::
L1_1 = 0
L2_1 = ""
L3_1 = 1
L4_1 = #L0_1
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = string
  L7_1 = L7_1.match
  L8_1 = L0_1[L6_1]
  L9_1 = "[^=]+$"
  L7_1 = L7_1(L8_1, L9_1)
  L2_1 = L7_1
  if L2_1 == "true" then
    L1_1 = L1_1 + 1
  end
end
if 4 <= L1_1 then
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "RansomwareFeaturesData"
  L5_1 = safeJsonSerialize
  L6_1 = L0_1
  L5_1 = L5_1(L6_1)
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = reportSessionInformationInclusive
  L3_1()
  L3_1 = sms_untrusted_process
  L3_1()
  L3_1 = reportTimingData
  L3_1()
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
