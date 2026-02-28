local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetLnkInfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.RelativePath
if not L1_1 then
  L1_1 = nil
end
L2_1 = contains
L3_1 = L1_1
L4_1 = "..\\..\\"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = StringEndsWith
L3_1 = L1_1
L4_1 = "\\cmd.exe"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = StringEndsWith
  L3_1 = L1_1
  L4_1 = "\\powershell.exe"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = L0_1.IconIndex
if not L2_1 then
  L2_1 = nil
end
if L2_1 ~= 0 and L2_1 ~= 1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L0_1.IconLocation
if not L3_1 then
  L3_1 = nil
end
if L3_1 ~= nil then
  L4_1 = StringEndsWith
  L5_1 = L3_1
  L6_1 = ".pdf"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
