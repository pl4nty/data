local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_PATH
L0_1 = L0_1(L1_1)
if L0_1 and L0_1 ~= "" then
  L1_1 = ""
  L2_1 = "setting.dat"
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = -1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "\\" then
    L3_1 = L0_1
    L4_1 = L2_1
    L1_1 = L3_1 .. L4_1
  else
    L3_1 = L0_1
    L4_1 = "\\"
    L5_1 = L2_1
    L1_1 = L3_1 .. L4_1 .. L5_1
  end
  L3_1 = sysio
  L3_1 = L3_1.IsFileExists
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.ReportLowfi
    L4_1 = L1_1
    L5_1 = 2130772754
    L3_1(L4_1, L5_1)
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
