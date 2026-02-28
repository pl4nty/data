local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = ".zip->version."
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = StringEndsWith
  L2_1 = L0_1
  L3_1 = ".js"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = set_research_data
    L2_1 = "IOAVUrl"
    L3_1 = MpCommon
    L3_1 = L3_1.Base64Encode
    L4_1 = mp
    L4_1 = L4_1.IOAVGetDownloadUrl
    L4_1, L5_1 = L4_1()
    L3_1 = L3_1(L4_1, L5_1)
    L4_1 = false
    L1_1(L2_1, L3_1, L4_1)
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
