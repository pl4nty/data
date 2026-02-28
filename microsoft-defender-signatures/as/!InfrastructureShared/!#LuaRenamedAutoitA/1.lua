local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = MpCommon
L0_1 = L0_1.PathToWin32Path
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FULL
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
L1_1, L2_1, L3_1, L4_1 = L1_1(L2_1, L3_1, L4_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = 0
L4_1 = 4
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == "\\\\?\\" then
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = 5
  L1_1 = L1_1(L2_1, L3_1)
  L0_1 = L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.SetOriginalFileName
L2_1 = L0_1
L3_1 = "autoit3.exe"
L1_1(L2_1, L3_1)
L1_1 = IsKeyInRollingQueue
L2_1 = "RenamedAutoitPath"
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L0_1
L3_1 = L3_1(L4_1)
L4_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1)
if not L1_1 then
  L1_1 = AppendToRollingQueue
  L2_1 = "RenamedAutoitPath"
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L0_1
  L3_1, L4_1 = L3_1(L4_1)
  L1_1(L2_1, L3_1, L4_1)
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
