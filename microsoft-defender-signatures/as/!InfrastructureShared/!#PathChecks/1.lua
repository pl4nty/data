local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "\\avg\\"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "Lua:InAvgFolder"
  L1_1(L2_1)
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_PATH
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 then
  L1_1 = sysio
  L1_1 = L1_1.FindFiles
  L2_1 = L0_1
  L3_1 = "*.pdb"
  L4_1 = 4
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  if L1_1 then
    L2_1 = pairs
    L3_1 = L1_1
    L2_1, L3_1, L4_1 = L2_1(L3_1)
    for L5_1, L6_1 in L2_1, L3_1, L4_1 do
      L7_1 = mp
      L7_1 = L7_1.ReportLowfi
      L8_1 = L6_1
      L9_1 = 3390914334
      L7_1(L8_1, L9_1)
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
