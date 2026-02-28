local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetLnkInfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.Arguments
if not L1_1 then
  L1_1 = L0_1.RelativePath
  if not L1_1 then
    L1_1 = nil
  end
end
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L0_1.IconLocation
if not L2_1 then
  L2_1 = nil
end
if L2_1 ~= nil then
  L3_1 = contains
  L4_1 = L2_1
  L5_1 = {}
  L6_1 = "zipfldr.dll"
  L7_1 = "shell32.dll"
  L5_1[1] = L6_1
  L5_1[2] = L7_1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    goto lbl_39
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_39::
L3_1 = contains
L4_1 = L1_1
L5_1 = {}
L6_1 = ".js"
L7_1 = ".cmd"
L5_1[1] = L6_1
L5_1[2] = L7_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = contains
  L4_1 = L1_1
  L5_1 = "..\\..\\"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
