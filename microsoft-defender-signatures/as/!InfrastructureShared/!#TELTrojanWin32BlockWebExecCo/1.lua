local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetScanSource
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.SCANSOURCE_IOAV_WEB
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.IOAVGetDownloadUrl
L1_1 = L1_1()
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L4_1 = "https?://([^/]+)/"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = false
L4_1 = string
L4_1 = L4_1.find
L5_1 = L2_1
L6_1 = "dropbox%.com"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L3_1 = true
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L2_1
L6_1 = "drive%.google%.com"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L3_1 = true
end
if L3_1 == false then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
