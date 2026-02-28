local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = "wintool.exe"
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_PATH
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
if L1_1 == nil or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = L1_1
L5_1 = "\\"
L6_1 = L2_1
L4_1 = L4_1 .. L5_1 .. L6_1
L3_1 = L3_1(L4_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L2_1
L6_1 = ".exe->(rarsfx)->"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 then
  L4_1 = string
  L4_1 = L4_1.sub
  L5_1 = L2_1
  L6_1 = 1
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L2_1
  L9_1 = "->"
  L10_1 = 1
  L11_1 = true
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  L7_1 = L7_1 - 1
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  if L4_1 ~= L0_1 then
    L5_1 = mp
    L5_1 = L5_1.changedetectionname
    L6_1 = 3902275675
    L5_1(L6_1)
  end
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
