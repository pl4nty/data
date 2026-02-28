local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
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
L2_1 = nil
L3_1 = "base64"
L4_1 = string
L4_1 = L4_1.lower
L5_1 = tostring
L6_1 = headerpage
L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
L2_1 = L4_1
L4_1 = string
L4_1 = L4_1.find
L5_1 = L2_1
L6_1 = L3_1
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
