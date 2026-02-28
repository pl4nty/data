local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.IOAVGetDownloadUrl
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_HAS_MOTW_ADS
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.GetMOTWZone
    L1_1 = L1_1()
    L2_1 = L1_1 == 3 or L1_1 == 4
    if L2_1 then
      L3_1 = mp
      L3_1 = L3_1.GetMOTWHostUrl
      L3_1 = L3_1()
      L0_1 = L3_1
    end
  end
end
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
if L0_1 == "https://web.whatsapp.com/" then
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
