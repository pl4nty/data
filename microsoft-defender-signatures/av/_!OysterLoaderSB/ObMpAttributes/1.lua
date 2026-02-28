local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.IOAVGetDownloadUrl
L0_1 = L0_1()
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = "^https?:\\/\\/[^\\/]+\\/(?:gov|secure|model|market|store)(?:\\/(?:gov|secure|model|market|store))?\\/[0-9a-fA-F]{42,64}$"
L2_1 = MpCommon
L2_1 = L2_1.StringRegExpSearch
L3_1 = L1_1
L4_1 = L0_1
L2_1, L3_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L4_1 = mp
  L4_1 = L4_1.GetCertificateInfo
  L4_1 = L4_1()
  L5_1 = pairs
  L6_1 = L4_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = L9_1.Signers
    if L10_1 == nil then
      L10_1 = mp
      L10_1 = L10_1.CLEAN
      return L10_1
    end
  end
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
