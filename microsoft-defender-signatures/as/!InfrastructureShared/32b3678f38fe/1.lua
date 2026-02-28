local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = "http://b1566530-7dcc-4568-a501-3ca8bb16c014.info"
L1_1 = {}
L1_1[1] = L0_1
L2_1 = {}
L2_1.SIG_CONTEXT = "BM"
L2_1.CONTENT_SOURCE = "AdaptiveTP_TamperingGen"
L2_1.TAG = "NOLOOKUP"
L3_1 = pcall
L4_1 = mp
L4_1 = L4_1.GetUrlReputation
L5_1 = L1_1
L6_1 = L2_1
L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 and L4_1 then
  L5_1 = L4_1.urls
  if L5_1 then
    goto lbl_28
  end
end
L5_1 = bm
L5_1 = L5_1.add_related_string
L6_1 = "CloudAdvice"
L7_1 = "empty"
L8_1 = bm
L8_1 = L8_1.RelatedStringBMReport
L5_1(L6_1, L7_1, L8_1)
::lbl_28::
L5_1 = ipairs
L6_1 = L4_1.urls
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = L9_1.determination
  if L10_1 == 4 then
    L10_1 = bm
    L10_1 = L10_1.add_related_string
    L11_1 = "CloudAdvice"
    L12_1 = safeJsonSerialize
    L13_1 = L9_1
    L12_1 = L12_1(L13_1)
    L13_1 = bm
    L13_1 = L13_1.RelatedStringBMReport
    L10_1(L11_1, L12_1, L13_1)
    L10_1 = mp
    L10_1 = L10_1.INFECTED
    return L10_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
