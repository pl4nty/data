local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.UfsGetMetadataBool
L1_1 = "Lua:FileInZip"
L2_1 = true
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 0 or not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_FILEPATH
L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1(L4_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "\\downloads"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L2_1
  L5_1 = -10
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "\\downloads" then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:HtaInsideZipDownloadsBasePath"
    L3_1(L4_1)
  else
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "\\downloads\\"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.set_mpattribute
      L4_1 = "Lua:HtaInsideZipDownloadsWithSubPath"
      L3_1(L4_1)
    end
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
